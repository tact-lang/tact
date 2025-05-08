struct OptionalsNested {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract TestOptional {
    val: OptionalsNested;

    init() {
        self.val = OptionalsNested{
            i: null,
            b: true,
            s: "hello",
        };
    }
}