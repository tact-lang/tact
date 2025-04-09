struct StructA {
    a: Int;
    b: Bool;
}

struct StructB {
    sa: StructA;
    s: String;
}

struct StructC {
    sb: StructB;
    n: Int?;
    addr: Address;
}

contract Test10 {
    sc: StructC;

    init() {
        self.sc = StructC{
            sb: StructB{
                sa: StructA{a: 5, b: true},
                s: "nested",
            },
            n: null,
            addr: myAddress(),
        };
    }

    receive() {}
}