struct SWithOption {
    opt: Int?;
}

contract FieldNull {
    s: SWithOption;

    init() {
        self.s = SWithOption{ opt: null };
    }
}