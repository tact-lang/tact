struct TwoOptions {
    one: Int?;
    two: Bool?;
}

struct ContainOpt {
    big: TwoOptions?;
    other: Int;
}

contract NestedOptionals {
    multi: ContainOpt;
    init() {
        self.multi = ContainOpt{
            big: TwoOptions{one: null, two: true},
            other: 100
        };
    }
}
