struct MixedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    data: MixedOptionals;

    init() {
        self.data = MixedOptionals{
            a: null,
            b: true,
            c: "hi"
        };
    }
}