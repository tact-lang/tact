struct Pair {
    x: Int;
    y: Int;
}

struct NestedOptional {
    maybePair: Pair?;
    flag: Bool;
}

contract TestContract {
    optNested: NestedOptional;

    init() {
        self.optNested = NestedOptional{
            maybePair: Pair{
                x: 5,
                y: 7
            },
            flag: true
        };
    }
}