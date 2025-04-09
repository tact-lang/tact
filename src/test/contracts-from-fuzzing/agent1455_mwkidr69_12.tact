struct HasBool {
    x: Bool;
}

contract OptionalStructInnerField {
    s: HasBool?;

    init() {
        self.s = HasBool{x:true};
    }
}
