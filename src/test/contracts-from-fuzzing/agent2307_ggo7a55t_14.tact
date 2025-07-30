struct Inner1 {
    a: Int?;
}

struct Inner2 {
    inner: Inner1;
}

struct Outermost {
    in2: Inner2?;
}

contract OptNest {
    store: Outermost;

    init() {
        self.store = Outermost{
            in2: Inner2{
                inner: Inner1{a: null}
            }
        };
    }
}
