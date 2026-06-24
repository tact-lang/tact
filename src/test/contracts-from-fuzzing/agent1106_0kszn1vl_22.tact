struct Level2 {
    inn: Int;
    opt: Bool?;
    txt: String;
}
struct Level1 {
    nested: Level2;
}

contract OptionalNestedComposite {
    multi: Level1?;

    init() {
        self.multi = null;
    }
}