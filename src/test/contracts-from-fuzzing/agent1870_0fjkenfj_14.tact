struct A {
    flag: Bool;
    info: B;
}

struct B {
    text: String;
    value: Int;
}

contract NestedMixed {
    data: A;

    init() {
        self.data = A {
            flag: true,
            info: B {
                text: "hello",
                value: 10
            }
        };
    }
}
