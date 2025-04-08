struct RepeatedOpt {
  a: Int?;
  b: Int?;
  c: Int?;
}

contract RepeatOptTest {
  val: RepeatedOpt;
  init() {
    self.val = RepeatedOpt{ a:null, b:null, c:null };
  }
}