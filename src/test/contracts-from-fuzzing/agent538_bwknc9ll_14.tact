struct OptionalString {
    s: String?;
}

struct MidLevel {
    i: Int;
    os: OptionalString; 
}

struct HighLevel {
    m: MidLevel;
    text: String;
}

contract NestedOptionalField {
    h: HighLevel;

    init() {
        self.h = HighLevel{
            m: MidLevel{
                i:7,
                os: OptionalString{s: null}
            },
            text: "done"
        };
    }
}
