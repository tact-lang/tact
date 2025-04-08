struct Wrapped {
    opt: Int?;
    flag: Bool;
}

contract OptionalNested {
    data: Wrapped?;
    init() {
        self.data = Wrapped{ opt: null, flag: false };
    }
}