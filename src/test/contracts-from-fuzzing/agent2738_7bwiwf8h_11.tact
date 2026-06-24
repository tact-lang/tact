struct First {
    a: Int;
}

struct Second {
    b: Bool;
}

struct Combined {
    f: First;
    s: Second;
}

contract MultiEmbedded {
    val: Combined;

    init() {
        self.val = Combined{f: First{a:1}, s: Second{b:true}};
    }
}
