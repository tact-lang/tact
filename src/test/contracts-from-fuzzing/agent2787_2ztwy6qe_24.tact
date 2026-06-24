struct S {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
}

contract ParamMix(
  a: Int,
  s: S,
  opt: Bool?,
  emb: S?,
  txt: String
) {}
