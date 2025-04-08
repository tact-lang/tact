struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract ComplexOptionals {
    data: DeepOptionals;

    init() {
        self.data = DeepOptionals{
            a: null,
            b: true,
            c: "hi",
        };
    }
}