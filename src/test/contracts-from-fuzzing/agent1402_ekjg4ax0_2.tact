struct ComplexOptionals {
    i: Int?;
    b: Bool?;
    a: Address?;
    c: Cell?;
    s: String?;
}

contract Test2 {
    val: ComplexOptionals;

    init() {
        self.val = ComplexOptionals{
            i: null,
            b: true,
            a: null,
            c: null,
            s: "hello"
        };
    }
}