struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: 42,
            b: null,
            c: "hello",
        };
    }
}