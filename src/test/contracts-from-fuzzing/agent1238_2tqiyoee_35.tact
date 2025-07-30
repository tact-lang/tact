struct Complex {
  intVal: Int;
  boolVal: Bool;
  strVal: String;
  optInt: Int?;
  optStr: String?;
  optBool: Bool?;
}

contract ComplexStorageTest {
  c: Complex;

  init() {
    self.c = Complex{
      intVal:1,boolVal:true,strVal:"s",optInt:null,optStr:"o",optBool:false
    };
  }
}