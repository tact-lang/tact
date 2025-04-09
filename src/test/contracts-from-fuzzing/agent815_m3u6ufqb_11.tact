struct Arr {
    a: Int;
    b: String;
}

struct Outer {
    i1: Arr;
    i2: Arr;
    i3: Arr;
    i4: Arr;
}

contract WideNesting {
    storage: Outer;

    init() {
        self.storage = Outer{
            i1: Arr{ a:1, b:"a" },
            i2: Arr{ a:2, b:"b" },
            i3: Arr{ a:3, b:"c" },
            i4: Arr{ a:4, b:"d" },
        };
    }
}