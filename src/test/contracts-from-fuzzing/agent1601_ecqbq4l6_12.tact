struct HasOptionalBool {
    maybe: Bool?;
}

contract OptionalBoolField {
    f: HasOptionalBool;
    init() {
        self.f = HasOptionalBool{ maybe: null };
    }
}