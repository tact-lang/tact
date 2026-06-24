struct NestedStr {
   label: String;
   desc: String?;
   flag: Bool;
}

contract DefaultAndOptionals {
    info: NestedStr;
    init() {
      self.info = NestedStr{ label: "abc", desc: null, flag: true };
    }
}