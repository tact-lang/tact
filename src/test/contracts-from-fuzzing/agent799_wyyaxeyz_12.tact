struct StructA {
    a: Int;
}

struct StructB {
    b: Int;
}

struct StructC {
    c: Int;
}

struct Container {
    sa: StructA;
    sb: StructB;
    sc: StructC;
}

contract ManyStructs {
    payload: Container;
    init() {
        self.payload = Container{
            sa: StructA{a:1},
            sb: StructB{b:2},
            sc: StructC{c:3}
        };
    }
}