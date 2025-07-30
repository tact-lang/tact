struct StructA {
    x: Int;
    y: Bool?;
    z: String;
}

struct StructB {
    m: String?;
    n: Int?;
    o: Bool;
}

contract MultiStructPersist {
    a: StructA;
    b: StructB;

    init() {
        self.a = StructA{
            x: 10,
            y: null,
            z: "abc",
        };
        self.b = StructB{
            m: "def",
            n: null,
            o: true,
        };
    }
}

contract Dummy { receive(){} }