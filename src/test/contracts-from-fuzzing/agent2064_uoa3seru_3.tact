struct InnerLevel {
    number: Int;
    text: String;
    enabled: Bool;
}

struct MidLevel {
    one: InnerLevel;
    two: InnerLevel;
}

contract HighlyNested {
    config: MidLevel = MidLevel{
        one: InnerLevel{ number: 0, text: "", enabled: false },
        two: InnerLevel{ number: 0, text: "", enabled: false }
    };
}
