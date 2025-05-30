struct OptionalDeep {
    x: Int;
    y: Bool;
}

contract OptionalPersist {
    s: OptionalDeep?;
    init() {
        self.s = OptionalDeep{x:42,y:true};
    }
}