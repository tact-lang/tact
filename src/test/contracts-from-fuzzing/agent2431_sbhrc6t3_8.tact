struct C {
    thing: Int?;
}

struct B {
    data: String;
    more: C;
}

struct A {
    flag: Bool;
    nested: B;
}

contract Depth3 {
    store: A;

    init() {
        self.store = A{
            flag: true,
            nested: B{
                data: "hello",
                more: C{ thing: null }
            }
        };
    }
}