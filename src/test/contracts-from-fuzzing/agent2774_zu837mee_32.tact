// optional struct inside optional struct
struct InnerStruct {
  x: Int;
}

struct OuterStruct {
  inner: InnerStruct?;
}

contract TestContract {
  data: OuterStruct?;

  init() {
    self.data = OuterStruct{
      inner: null
    };
  }
}