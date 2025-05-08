struct HasOption {
    x: Int?;
}

contract OptionOnField {
    field: HasOption;

    init() {
        self.field = HasOption{ x: null };
    }
}