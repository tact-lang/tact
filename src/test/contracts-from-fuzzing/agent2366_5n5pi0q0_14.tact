struct SubA {
    s: String;
}

struct SubB {
    t: Int;
}

struct SubC {
    u: Bool;
}

struct Container {
    a: SubA;
    b: SubB;
    c: SubC;
}

contract NestedContainer {
    field: Container;

    init() {
        self.field = Container{
            a: SubA{s:"hi"},
            b: SubB{t:1},
            c: SubC{u:true}
        };
    }
}