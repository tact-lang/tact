struct StructA {
    a: Int;
}

struct StructB {
    b: Bool;
    sa: StructA;
}

struct StructC {
    sc: StructB;
    info: String;
}

contract DeepFieldContract {
    data: StructC;

    init() {
        self.data = StructC{
            sc: StructB{
                b: true,
                sa: StructA{a: 8}
            },
            info: "info"
        };
    }
}
