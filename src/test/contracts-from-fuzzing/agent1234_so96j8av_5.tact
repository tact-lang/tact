struct Sub {
    x: Int?;
    y: Bool?;
}

struct Outer {
    a: Sub;
    b: Sub;
}

contract ComplexNested {
    data: Outer;

    init() {
        self.data = Outer{
            a: Sub{ x: null, y: true },
            b: Sub{ x: 42, y: null },
        };
    }
}