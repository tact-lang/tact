struct SubNested {
  val:Int;
}

struct NestedData {
  inner:SubNested;
}

contract LayeredStructs {
  data:NestedData;

  init(){
    self.data=NestedData{inner:SubNested{val:7}};
  }
}