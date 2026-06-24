struct NestedMultiOptional {
    x: Int?;
    label: String?
}

struct OuterOpt {
    inner: NestedMultiOptional?;
    flag: Bool;
}

contract NestedOptionals {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null,
            flag: true,
        };
    }
}
