struct A {
    a: Int;
}

struct B {
    b: Int;
    optA: A?;
}

struct C {
    flag: Bool;
    optB: B?;
}

contract Test {
    s: C;
    init() {
        self.s = C{
            flag: true,
            optB: B{b:10,optA:null}
        };
    }
}