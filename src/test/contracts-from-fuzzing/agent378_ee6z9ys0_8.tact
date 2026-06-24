struct InnerOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    data: InnerOptional;

    init() {
        self.data = InnerOptional{
            a: null,
            b: true,
            c: "hi",
        };
    }
}