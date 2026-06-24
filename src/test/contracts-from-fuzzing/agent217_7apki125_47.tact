struct VarSizes {
 a: Int as uint8;
 b: Int as int64;
 c: Int as uint4;
}

contract ParamVarSizes(
  arg: VarSizes,
  num: Int,
) {}