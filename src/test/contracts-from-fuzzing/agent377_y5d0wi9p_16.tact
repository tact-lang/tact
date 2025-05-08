struct DeepOption1 { x: Int?; }
struct DeepOption2 { x: DeepOption1?; }
struct DeepOption3 { x: DeepOption2?; }
struct DeepOption4 { x: DeepOption3?; }

contract VeryDeepOptionals {
  opt: DeepOption4 = DeepOption4{x:null};
}