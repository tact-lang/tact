struct Low {
    value: Int;
}

struct MidLevel {
    low: Low?;
    label: String = "default label";
}

struct HighLevel {
    mid: MidLevel?;
}

contract DeepMixedOptionals {
    storage: HighLevel;

    init() {
        self.storage = HighLevel{
            mid: MidLevel{
                low: null,
            },
        };
    }
}