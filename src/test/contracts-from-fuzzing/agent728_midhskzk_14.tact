struct D {
    leafVal: Int;
    flag: Bool;
}

struct C {
    innerD: D;
    info: String;
}

struct B {
    innerC: C;
    num: Int;
}

struct A {
    innerB: B;
    status: Bool;
}

contract DeepChain {
    state: A;

    init() {
        self.state = A{
            innerB: B{
                innerC: C{
                    innerD: D{
                        leafVal: 123,
                        flag: true
                    },
                    info: "hey"
                },
                num: 42
            },
            status: false
        };
    }
}