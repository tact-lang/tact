struct NestedOption {
    opt: Int?;
    flag: Bool;
}

contract OptionalNested {
    data: NestedOption?;

    init() {
        self.data = NestedOption{
            opt: 42,
            flag: true,
        };
    }
}
