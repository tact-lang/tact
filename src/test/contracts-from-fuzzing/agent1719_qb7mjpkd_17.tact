struct StringArrayLike {
    s1: String?;
    s2: String?;
    s3: String?;
}

struct Container {
    arr: StringArrayLike;
    count: Int;
}

contract OptionPseudoArray {
    storage: Container;

    init() {
        self.storage = Container{
            arr: StringArrayLike{
                s1: "one",
                s2: null,
                s3: "three"
            },
            count: 2
        };
    }
}