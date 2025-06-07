// optional struct inside defaulted struct
struct Inner { foo: Int; }
struct Outer {
    a: Inner?;
    b: Int = 3;
}

contract OptInDefault {
    data: Outer;

    init() {
        self.data = Outer{ a: null };
    }
}