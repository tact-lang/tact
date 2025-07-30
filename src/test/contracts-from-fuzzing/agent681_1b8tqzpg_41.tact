struct DeepWrap1 { 
 foo: Int;
}

struct DeepWrap2 {
 a: DeepWrap1;
}

struct DeepWrap3 {
 b: DeepWrap2;
}

contract FieldSerializeDeep {
 top: DeepWrap3;

 init() {
  self.top = DeepWrap3{
    b: DeepWrap2{
      a: DeepWrap1{foo:123}
    }
  };
 }
}