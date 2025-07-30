struct OuterOptional {
    nested: Int?;
}

contract OptionalStructPersistent {
    state: OuterOptional;
    init() {
        self.state = OuterOptional{nested: null};
    }
}