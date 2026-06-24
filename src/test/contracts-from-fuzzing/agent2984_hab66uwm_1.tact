struct OptionalNested {
    val: Int?;
    flag: Bool?;
}

contract Test2 {
    opt: OptionalNested;

    init() {
        self.opt = OptionalNested{ val: null, flag: true };
    }
}
