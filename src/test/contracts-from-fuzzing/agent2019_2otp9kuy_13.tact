// Many nested wrapped structs with optional inside
struct Bottom {
    x: Int?;
}

struct Middle {
    b: Bottom;
}

struct Top {
    m: Middle;
}

contract OptionalBottom {
    t: Top;
    init() {
        self.t = Top{ m: Middle{ b: Bottom{ x: null } } };
    }
}