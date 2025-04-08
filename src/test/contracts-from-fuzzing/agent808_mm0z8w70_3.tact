struct OptStruct {
  flag: Bool?; 
  num: Int?;
  txt: String?;
  sliceVal: Slice?;
}

contract OptionalStructField {
  field: OptStruct;

  init() {
    self.field = OptStruct{
      flag: null,
      num: null,
      txt: null,
      sliceVal: null
    };
  }
}