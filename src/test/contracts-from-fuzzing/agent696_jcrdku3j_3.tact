struct HasOptionalFields {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    val: HasOptionalFields;

    init() {
        self.val = HasOptionalFields{
            x: null,
            y: true
        };
    }
}