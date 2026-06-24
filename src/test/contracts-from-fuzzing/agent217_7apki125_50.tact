struct Leaf { val: Int; }
struct Level1 { inner: Leaf?; }
struct Level2 { inner: Level1?; }

contract DeepNestOptParam(
  wrapped: Level2?,
) {}