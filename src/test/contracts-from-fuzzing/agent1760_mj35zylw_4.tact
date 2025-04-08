struct A {
    x: Int;
}

struct B {
    y: Int;
    nested: A;
    flag: Bool;
    text: String;
}

struct C {
    z: Bool;
    innerB: B;
    desc: String;
}

contract MultiStruct {
    state: C;

    init() {
        self.state = C{
            z: false,
            innerB: B{
                y: 42,
                nested: A{x: 1},
                flag: true,
                text: "hi"
            },
            desc: "test"
        };
    }
}