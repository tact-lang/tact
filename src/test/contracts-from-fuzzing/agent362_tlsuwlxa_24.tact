struct DeepOptional {
    nested: OptionalStruct?;
    flag: Bool;
}

contract TestContract {
    f: DeepOptional;

    init() {
        self.f = DeepOptional{
            nested: null,
            flag: false
        };
    }

    receive() {
        self.f = DeepOptional{
            nested: OptionalStruct{ i: 5, b: true, s: "z" },
            flag: true
        };
    }
}

struct OptionalStruct {
    i: Int?;
    b: Bool?;
    s: String?;
}