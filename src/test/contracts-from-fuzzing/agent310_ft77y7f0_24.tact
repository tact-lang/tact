// contract with struct param
struct PStruct {
  a: Int;
  b: Bool?;
}

contract ParamStruct(
  x: PStruct,
  y: PStruct?,
) {}
