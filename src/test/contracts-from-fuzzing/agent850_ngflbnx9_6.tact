struct NestedStrings {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
}

struct Wrapped {
    inner: NestedStrings;
    flag: Bool;
    count: Int;
}

contract StringFields {
    wrapped: Wrapped;

    init() {
        self.wrapped = Wrapped{
            inner: NestedStrings{
                s1: "alpha",
                s2: null,
                s3: "beta",
                s4: "gamma"
            },
            flag: true,
            count: 5
        };
    }
}
