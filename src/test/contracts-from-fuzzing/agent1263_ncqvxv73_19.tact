// long nested chain with optional contract parameter root
struct Bottom { z: Int; }
struct Mid { y: Bottom?; }
struct Top { x: Mid?; }

contract Test(
    root: Top?
) {}