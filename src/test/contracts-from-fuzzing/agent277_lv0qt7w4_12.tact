struct WrappedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    val: WrappedOptionals;
    init() {
        self.val = WrappedOptionals{
            a: null,
            b: null,
            c: "hello"
        };
    }
}