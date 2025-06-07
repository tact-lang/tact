struct MultiA { x: Int; y: Bool; z: String; }
struct MultiB { p: Int; q: MultiA; r: Bool?; s: String?; }

contract Variations(
    one: MultiA,
    two: MultiB?
) {}