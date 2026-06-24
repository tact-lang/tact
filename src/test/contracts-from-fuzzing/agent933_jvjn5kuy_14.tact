struct StructA {
    a: Int;
    b: Int;
}

struct StructB {
    x: Bool;
    y: String;
    z: StructA;
}

contract CrossNested {
    s: StructB;

    init() {
        self.s = StructB{
            x: true,
            y: "bar",
            z: StructA{a:10,b:20}
        };
    }
}
