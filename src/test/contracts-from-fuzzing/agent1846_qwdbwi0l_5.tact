struct Leaf {
  val: Int?; // implicit null default
}

struct Middle {
  leaf: Leaf = Leaf{};
}

contract OptionalInDeepStruct {
  mid: Middle = Middle{};
}