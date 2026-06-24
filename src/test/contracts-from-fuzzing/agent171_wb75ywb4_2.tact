struct DeepNested { inner: InnerStruct }
struct InnerStruct { val: Int; optVal: String? }

contract TestNested {
  deep: DeepNested;
  init() {
    self.deep = DeepNested{ inner: InnerStruct{ val: 42, optVal: null } };
  }
}