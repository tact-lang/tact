// Optional struct nested in struct nested in contract
struct NestedStruct {
  sub: Int?;
}
struct ContainerStruct {
  nested: NestedStruct?;
}
contract LayeredOpt {
  c: ContainerStruct;
  init() {
    self.c = ContainerStruct{
      nested: null
    };
  }
}
