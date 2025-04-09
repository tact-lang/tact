struct StructA {
    a: Int;
}

struct StructB {
    b: Bool;
}

struct StructC {
    c: String;
}

contract ManyNestedDifferent {
    sa: StructA;
    sb: StructB;
    sc: StructC;

    init() {
        self.sa = StructA{a: 1};
        self.sb = StructB{b: true};
        self.sc = StructC{c: "hello"};
    }
}