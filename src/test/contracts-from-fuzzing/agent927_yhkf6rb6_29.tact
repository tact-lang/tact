struct SeriesOpt {
  a: Int as uint8;
  b: Bool;
  c: String?;
}

contract SeriesOptTest {
  store: SeriesOpt;

  init() {
    self.store = SeriesOpt{
      a: 12,
      b: true,
      c: null
    };
  }
}