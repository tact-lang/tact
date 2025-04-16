struct Sub {
    data: Int;
    ok: Bool;
}

struct Container {
    s1: Sub?;
    s2: Sub?;
    s3: Sub?;
    s4: Sub?;
    s5: Sub?;
}

contract OptNested {
    state: Container;

    init() {
        self.state = Container{
            s1: null,
            s2: null,
            s3: null,
            s4: null,
            s5: null,
        };
    }
}
