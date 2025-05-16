struct MiddleOne {
    foo: Int;
    nested: MiddleTwo;
}

struct MiddleTwo {
    bar: Int;
    nested: MiddleThree;
}

struct MiddleThree {
    baz: Int;
}

contract TestContract {
    state: MiddleOne;

    init() {
        self.state = MiddleOne{
            foo: 1,
            nested: MiddleTwo{
                bar: 2,
                nested: MiddleThree{
                    baz: 3
                }
            }
        };
    }
}
