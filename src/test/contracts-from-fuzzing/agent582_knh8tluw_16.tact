struct EmbeddedDefaults {
    a: Int = 7;
    b: String = "Test";
}

struct OuterEmbed {
    data: EmbeddedDefaults;
    value: Int;
}

contract DefaultsNested {
    d: OuterEmbed;

    init() {
        self.d = OuterEmbed{
            data: EmbeddedDefaults{},
            value: 777
        };
    }
}
