struct RecursiveLike {
    opt: Outer?;
}

struct Outer {
    value: Int;
}

contract WeirdOpt {
    param: RecursiveLike;

    init() {
        self.param = RecursiveLike{
            opt: null
        };
    }
}