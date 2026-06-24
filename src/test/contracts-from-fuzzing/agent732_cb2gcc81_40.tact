struct SerializeOpt {
  i: Int? as int16;
  b: Bool?;
  s: String?;
}

contract SerializeOptTest {
  f: SerializeOpt;

  init() {
    self.f = SerializeOpt{
      i:null,
      b:true,
      s:null
    };
  }
}