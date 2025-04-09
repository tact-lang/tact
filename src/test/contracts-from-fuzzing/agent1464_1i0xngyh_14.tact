struct A {
    i: Int;
    optB: B?;
}

struct B {
    flag: Bool;
    txt: String;
    optC: C?;
}

struct C {
    num: Int;
    more: String?;
}

contract NestedOptionalLayers {
    data: A;

    init() {
        self.data = A{
            i:10,
            optB:null
        };
    }
}
