struct WideNested {
    n1: Nested;
    n2: Nested;
    n3: Nested;
    n4: Nested;
    n5: Nested;
}

struct Nested {
    v1: Int;
    v2: Int;
    v3: Int;
}

contract TestContract {
    wide: WideNested;

    init() {
        self.wide = WideNested{
            n1: Nested{v1:1, v2:2, v3:3},
            n2: Nested{v1:4, v2:5, v3:6},
            n3: Nested{v1:7, v2:8, v3:9},
            n4: Nested{v1:10, v2:11, v3:12},
            n5: Nested{v1:13, v2:14, v3:15}
        };
    }
}
