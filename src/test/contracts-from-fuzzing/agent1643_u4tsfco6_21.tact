struct Compose {
    first: Int;
    second: Inner;
}

struct Inner {
    third: Int;
    fourth: String;
    fifth: Bool?;
}

contract NestedSet {
    val: Compose;

    init() {
        self.val = Compose{
            first: 34,
            second: Inner{
                third: 12,
                fourth: "abc",
                fifth: null
            }
        };
    }
}