struct Leaf {
  score: Int?;
}

struct Mid {
  leaf: Leaf?;
  active: Bool?;
}

contract TestContract(
  info: Mid?,
  nickname: String?,
  verified: Bool?,
  count: Int?,
) {}