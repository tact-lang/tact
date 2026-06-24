struct OptDeep {
  subStruct: InnerStruct?;
}

struct InnerStruct {
  flag: Bool;
  optInt: Int?;
}

contract TestContract {
  deeplyOptional: OptDeep?;

  init() {
    self.deeplyOptional = OptDeep{
      subStruct: InnerStruct{
        flag: false,
        optInt: 123,
      }
    };
  }
}