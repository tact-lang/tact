struct Leaf { v: Int; }
struct Middle { l: Leaf?; }

contract OptDeepNull {
    m: Middle;
    init() {
        self.m = Middle{l: null};
    }
}