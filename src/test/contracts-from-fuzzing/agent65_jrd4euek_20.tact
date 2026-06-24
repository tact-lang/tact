struct Layer1 {
  field1: Int;
}

struct Layer2 {
  nested: Layer1;
}

struct Layer3 {
  nested: Layer2;
}

struct Layer4 {
  nested: Layer3;
}

struct Layer5 {
  nested: Layer4;
}

contract SuperDeep {
  data: Layer5;
  init() {
    self.data = Layer5{
      nested: Layer4{
        nested: Layer3{
          nested: Layer2{
            nested: Layer1{
              field1: 256
            }
          }
        }
      }
    };
  }
}