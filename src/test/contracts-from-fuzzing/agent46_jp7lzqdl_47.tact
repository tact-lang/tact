message(0xD1) MWithOptional { value: Int? }

contract MsgWithOptionalField {
    data: MWithOptional;

    init() {
        self.data = MWithOptional{ value: null };
    }
}
