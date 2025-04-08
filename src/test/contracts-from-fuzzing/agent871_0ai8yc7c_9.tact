struct B {
    v: Int = 5;
    s: String = "";
}

struct A {
    nested: B;
    n: Int = 1;
    flag: Bool = true;
}

contract DeepFieldAssign {
    state: A;

    init() {
        self.state = A{
            nested: B{
                s: "hello"
            },
            n: 42
        };
    }
}