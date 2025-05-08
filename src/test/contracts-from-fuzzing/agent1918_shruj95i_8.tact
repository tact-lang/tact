struct InnerStructA {
    a: Int;
}

struct InnerStructB {
    b1: Bool;
    b2: Bool?;
}

struct Outer {
    innerA: InnerStructA;
    innerB: InnerStructB;
    outerField: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            innerA: InnerStructA{ a: 123 },
            innerB: InnerStructB{ b1: true, b2: null },
            outerField: "test"
        };
    }
}