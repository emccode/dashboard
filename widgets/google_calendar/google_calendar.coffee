class Dashing.GoogleCalendar extends Dashing.Widget

  onData: (data) =>
    event = rest = null
    getEvents = (first, others...) ->
      event = first
      rest = others

    getEvents data.events...

    start = moment(event.start)
    end = moment(event.end)

    @set('event',event)
    @set('event_date', start.format('dddd Do MMMM'))
    #@set('event_times', start.format('HH:mm') + " - " + end.format('HH:mm'))

    next_events = []
    for next_event in rest
      start = moment(next_event.start)
      start_date = start.format('Do MMM')
      end = moment(next_event.end)
      end_date = end.subtract(1, 'days').format('Do MMM')
      #start_time = start.format('HH:mm')

      #next_events.push { summary: next_event.summary, start_date: start_date, start_time: start_time }
      next_events.push { summary: next_event.summary, start_date: start_date, end_date: end_date }
    @set('next_events', next_events)
