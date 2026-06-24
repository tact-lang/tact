struct SubSub { val: Int; }
struct Sub {
  x: SubSub;
  y: SubSub;
}
struct Top {
  a: Sub;
  b: Sub;
  c: Sub;
}

contract MultiLayers (
  p: Top
) {}