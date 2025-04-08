struct ContainerStruct {
  innerA: Int;
  innerB: Bool?;
}

contract OverwriteNestedField {
  data: ContainerStruct;

  init() {
    self.data = ContainerStruct{ innerA:5, innerB:null };
    self.data.innerA = 42;
    self.data.innerB = true;
  }
}