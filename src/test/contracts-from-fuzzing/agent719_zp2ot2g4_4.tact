struct InnerOpt {
    foo: Int?;
    bar: String?;
}

struct Outer {
    nested: InnerOpt;
    flag: Bool;
}

contract TestContract {
    state: Outer;
    init() {
        self.state = Outer{ nested: InnerOpt{foo: null, bar: null}, flag: true };
    }
}