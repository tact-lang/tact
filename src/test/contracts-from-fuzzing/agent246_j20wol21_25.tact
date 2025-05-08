struct StructA {
    i: Int;
    b: Bool;
}

struct StructB {
    a: StructA;
    s: String;
}

struct StructC {
    s: String;
    b: StructB;
    n: Int;
}

contract DeepLayered {
    layer: StructC;

    init() {
        self.layer = StructC{
            s: "level C",
            b: StructB{
                a: StructA{
                    i: 123,
                    b: true,
                },
                s: "level B",
            },
            n: 987,
        };
    }
}