struct EmbedOptionalStruct {
    part: OptionalStringStruct?;
}

struct OptionalStringStruct {
    str: String?;
    num: Int;
}

contract EmbedOptionTest {
    val: EmbedOptionalStruct;
    init() {
        self.val = EmbedOptionalStruct {
            part: OptionalStringStruct {
                str: null,
                num: 1
            }
        };
    }
}