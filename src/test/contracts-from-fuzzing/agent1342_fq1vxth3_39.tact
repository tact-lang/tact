// optional struct completely null
struct Inner {
    foo: Int;
}

struct Outer {
    part: Inner?;
}

contract NullOpt {
    state: Outer;

    init() {
        self.state = Outer{
            part: null
        };
    }
}