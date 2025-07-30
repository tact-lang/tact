struct StructA {
    x: Int;
    y: Bool;
}

struct StructB {
    a: StructA;
    z: String;
}

struct StructC {
    inner: StructB;
    q: Address;
}

contract MultiNestStruct {
    s: StructC;

    init() {
        self.s = StructC{
            inner: StructB{
                a: StructA{ x: 1, y: false },
                z: "hello",
            },
            q: myAddress(),
        };
    }

    receive() {
        let x = self.s;
    }
}