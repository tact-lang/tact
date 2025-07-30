struct StrStruct {
  s: String;
}

contract StrFieldC {
  val: StrStruct = StrStruct{ s: "hello" };
}