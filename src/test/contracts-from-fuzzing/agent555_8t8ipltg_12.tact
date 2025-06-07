struct OptionalIntString {
    num: Int?;
    text: String?;
}

struct MidStruct {
    part: OptionalIntString;
}

struct OuterStruct {
    middle: MidStruct;
}

contract OptNested {
    nested: OuterStruct;

    init() {
        self.nested = OuterStruct{
            middle: MidStruct{
                part: OptionalIntString {
                    num: null,
                    text: null,
                }
            }
        };
    }
}