struct StringNested {
  s: String;
  o: InnerString?;
}

struct InnerString {
  s2: String;
}

contract StringNestContract {
  data: StringNested;

  init() {
    self.data = StringNested{
      s: "outer",
      o: InnerString{
        s2: "inner"
      }
    };
  }
}