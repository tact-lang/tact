struct Leaf { x: Int }
struct Middle { l: Leaf? }

contract TestDeep(
    m: Middle?
) {}