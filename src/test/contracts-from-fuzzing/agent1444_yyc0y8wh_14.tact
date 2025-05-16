// optional struct as persistent field
struct OptionalContainer {
  payload: DataStruct?;
}

struct DataStruct {
  amount: Int;
  message: String;
  flag: Bool;
}

contract OptStructField {
  storage: OptionalContainer;

  init() {
    self.storage = OptionalContainer{payload: null};
  }
}
