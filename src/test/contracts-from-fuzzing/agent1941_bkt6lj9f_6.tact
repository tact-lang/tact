struct S1 {
    a: Int;
    opt: Inner1?;
}

struct Inner1 {
    x: Int;
    nestedOpt: Inner2?;
}

struct Inner2 {
    message: String;
}

contract TestContract {
    storage: S1;

    init() {
        self.storage = S1{
            a: 5,
            opt: Inner1{ x: 10, nestedOpt: null }
        };
    }
}