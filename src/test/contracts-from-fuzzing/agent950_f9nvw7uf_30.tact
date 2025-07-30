// deep nested permutation struct + contract param
struct D1 {
  val: Int?;
  next: D2?;
}
struct D2 {
  flag: Bool?;
  text: String?;
}

contract DeepParamNest(
    d: D1?
) {}