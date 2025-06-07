struct HasBoolOptional {
    flag: Bool?;
}

contract OptionalBoolStore {
    s: HasBoolOptional;

    init() {
        self.s = HasBoolOptional{flag: null};
    }
}