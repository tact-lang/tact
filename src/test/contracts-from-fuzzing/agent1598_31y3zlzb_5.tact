struct A {
    val: Int;
}

struct B {
    a: A;
    opt: Bool?;
}

struct C {
    b: B;
    s: String;
    flag: Bool;
}

contract DeepMix {
    store: C;
    init() {
        self.store = C{
            b: B{a: A{val:42}, opt:null},
            s: "hello",
            flag: true
        };
    }
}