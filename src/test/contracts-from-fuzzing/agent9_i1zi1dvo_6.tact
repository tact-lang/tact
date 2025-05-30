struct Inner {
    a: Int;
    b: Int;
}

struct WithNestedStructs {
    first: Inner;
    second: Inner;
}

contract NestedStructsFields {
    all: WithNestedStructs;

    init() {
        self.all = WithNestedStructs {
            first: Inner{a:1,b:2},
            second: Inner{a:3,b:4}
        };
    }
}