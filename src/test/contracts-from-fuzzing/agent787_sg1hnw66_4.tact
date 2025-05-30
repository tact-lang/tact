struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    data: ManyOptionals = ManyOptionals{ a: null, b: null, c: null, d: null };

    init() {
        self.data = ManyOptionals{
            a: 1,
            b: true,
            c: "test",
            d: null
        };
    }
}