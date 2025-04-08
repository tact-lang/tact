struct OptionalDeep {
    s: SubOptional?;
    name: String;
}

struct SubOptional {
    x: Int?;
    y: String?;
    flag: Bool;
}

contract DeepOptionalTest {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            s: null,
            name: "none"
        };
    }
}