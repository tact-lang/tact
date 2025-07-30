struct Nested {
    v: Int;
}

struct Wrap {
    nest: Nested?;
}

contract TestContract {
    state: Wrap;

    init() {
        self.state = Wrap{
            nest: null
        };
    }
}