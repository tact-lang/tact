struct OptInner {
    flag: Bool?;
    info: String?;
}

contract OptionalNested {
    nested: OptInner?;

    init() {
        self.nested = OptInner{
            flag: null,
            info: null,
        };
    }
}