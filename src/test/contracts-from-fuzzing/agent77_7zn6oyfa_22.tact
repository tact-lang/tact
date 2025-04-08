// Edge case: struct with multiple optional of complex nested struct types
struct InnerX { x: Int; }
struct InnerY { y: Bool; }

struct Nest {
 ix: InnerX;
 iy: InnerY;
}

struct Wrap {
 n1: Nest?;
 n2: Nest?;
}

contract OptNestMany {
    w: Wrap;
    init() {
        self.w = Wrap { n1:null, n2:null };
    }
}