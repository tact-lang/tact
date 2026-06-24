struct BigOpt {
  a: Int?;
  b: Bool?;
  c: Address?;
  d: Cell?;
  e: Slice?;
  f: String?;
}

contract OnlyOptStructs(
  o1: BigOpt?,
  o2: BigOpt?,
  o3: BigOpt?,
) {}