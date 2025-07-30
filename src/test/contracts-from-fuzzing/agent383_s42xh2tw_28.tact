struct SmallOpt {
  foo: Int?;
  bar: Bool?;
}

contract JustSmallOpt {
    data: SmallOpt;
    init() {
       self.data = SmallOpt{ foo:null, bar:null };
    }
}
