struct Middle {
    first: Inner;
    second: Inner;
}

struct Inner {
    f: Int;
}

contract DuplicateFieldsStructs {
    val: Middle;

    init() {
        self.val = Middle{
            first: Inner{f:1},
            second: Inner{f:2}
        };
    }
}