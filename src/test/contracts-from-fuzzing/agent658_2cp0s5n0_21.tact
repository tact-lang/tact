struct Small {
    x: Int;
}

struct Mid1 {
    prev: Small;
    y: Bool;
}

struct Mid2 {
    prev: Mid1;
    z: String;
}

struct Top {
    left: Mid2;
    right: Mid2;
}

contract TreeStruct {
    tree: Top;

    init() {
        self.tree = Top{
            left: Mid2{ prev: Mid1{prev: Small{x: 1}, y: true}, z: "left" },
            right: Mid2{ prev: Mid1{prev: Small{x: 2}, y: false}, z: "right" }
        };
    }
}