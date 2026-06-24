struct A {
    x: Int?;
}

struct B {
    a: A;
    y: Bool?;
}

contract OptInStruct {
    payload: B;

    init() {
        self.payload = B{
            a: A{x: null},
            y: null,
        };
    }
}