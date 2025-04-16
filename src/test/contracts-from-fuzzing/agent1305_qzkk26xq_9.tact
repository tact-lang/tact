struct OptNested {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Holder {
    opt1: OptNested?;
    opt2: OptNested?;
}

contract TestContract {
    data: Holder;

    init() {
        self.data = Holder{
            opt1: null,
            opt2: OptNested{
                a: null,
                b: true,
                c: "abc",
            },
        };
    }
}