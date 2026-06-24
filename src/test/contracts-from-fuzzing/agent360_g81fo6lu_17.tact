struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    val: NestedOpt?;

    init() {
        self.val = NestedOpt{
            a: 1,
            b: true,
            c: "hello",
            d: null,
        };
    }
}