struct OneOpt {
    foo: Int?;
}

struct NestedOpt {
    inner: OneOpt?;
}

contract NestedOptional {
    state: NestedOpt;
    init() {
        self.state = NestedOpt{
            inner: OneOpt{ foo: 7 }
        };
    }
}