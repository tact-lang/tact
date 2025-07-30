struct OptionStruct {
  a: Int?;
  b: Bool?;
}

struct UseNestedOption {
  o: OptionStruct?;
}

contract OptionalStructField {
  data: UseNestedOption;

  init() {
    self.data = UseNestedOption{ o:null };
  }
}