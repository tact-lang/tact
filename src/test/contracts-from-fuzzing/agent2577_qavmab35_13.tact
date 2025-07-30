struct Middle {
    first: Int;
    second: Bool;
    third: Inner;
    fourth: String?;
}

struct Inner {
    val: String;
}

contract NestedOptionals {
    storage: Middle;

    init() {
        self.storage = Middle{
            first: 5,
            second: false,
            third: Inner{val:"z"},
            fourth: null,
        };
    }
}
