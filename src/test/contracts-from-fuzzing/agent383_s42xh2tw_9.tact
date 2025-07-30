struct DefaultOpt {
  flag: Bool?; 
  age: Int?; 
  note: String;
}

contract OptionalDefault {
    person: DefaultOpt;
    init() {
        self.person = DefaultOpt{ flag: null, age: null, note: "" };
    }
}
