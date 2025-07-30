struct Inner1 {
    v1: Int;
    v2: Int;
    v3: Int;
}

struct Inner2 {
    s: String;
    b: Bool;
}

struct Combined {
    part1: Inner1;
    part2: Inner2;
}

contract MultiStructNested {
    data: Combined;

    init() {
        self.data = Combined {
            part1: Inner1 { v1: 1, v2: 2, v3: 3 },
            part2: Inner2 { s: "hi", b: true }
        };
    }
}
