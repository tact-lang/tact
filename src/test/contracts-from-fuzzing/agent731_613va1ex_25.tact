struct TinyNested {
    field: Small;
}

struct Small {
    n: Int = 5;
}

contract Tiny {
    t: TinyNested;

    init() {
        self.t = TinyNested{ field: Small{} };
    }
}