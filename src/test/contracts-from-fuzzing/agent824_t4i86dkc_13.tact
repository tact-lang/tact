struct Deep {
    foo: Int;
}

struct Mid {
    deep: Deep;
}

struct Top {
    opt: Mid?;
}

contract TestContract {
    val: Top;

    init() {
        self.val = Top{
            opt: Mid{deep: Deep{foo: 7}},
        };
    }
}