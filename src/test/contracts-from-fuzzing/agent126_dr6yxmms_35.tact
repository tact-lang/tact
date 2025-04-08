struct NestedMixOpt {
    level: Int;
    text: String?;
    more: Int? as uint16;
}

contract NestedMixOptional {
    mixed: NestedMixOpt;

    init() {
        self.mixed = NestedMixOpt{
            level: 77,
            text: null,
            more: null
        };
    }
}