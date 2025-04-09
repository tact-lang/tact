// nested struct with remaining slice
struct WithRemainder {
  val: Int;
  payload: Slice as remaining;
}

contract RemainTest {
  data: WithRemainder;
  
  init() {
    self.data = WithRemainder{
      val: 123,
      payload: slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=")
    };
  }
}
