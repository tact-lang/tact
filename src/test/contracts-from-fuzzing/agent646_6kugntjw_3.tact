struct A {
    a1: Int?;
    a2: Bool?;
    a3: String?;
}

struct B {
    b1: Int;
    b2: Bool;
    b3: String;
    nestedOpt: A?;
}

contract TestContract {
    data: B;

    init() {
        self.data = B{
            b1: 1,
            b2: true,
            b3: "test",
            nestedOpt: null
        };
    }
}