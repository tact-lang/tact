struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Slice?;
}

contract Opts {
    test: ManyOptionals = ManyOptionals{};
    init() {
        self.test = ManyOptionals{
            a: 1, b: true, c: "hello", d: myAddress(), e: emptyCell().asSlice(),
        };
    }
}