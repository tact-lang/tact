struct Optionals1 {
    a: Int?;
    b: Bool?;
}

struct Optionals2 {
    opt: Optionals1?;
    note: String;
}

contract DeepOptionals {
    state: Optionals2;

    init() {
        self.state = Optionals2{
            opt: null,
            note: "deep"
        };
    }
}
