contract OptionalInStruct {
  s: OuterOpt;

  init() {
    self.s = OuterOpt{
      a:InnerOpt{
        b:null
      }
    };
  }
}

struct OuterOpt { a: InnerOpt; }
struct InnerOpt { b: Int?; }