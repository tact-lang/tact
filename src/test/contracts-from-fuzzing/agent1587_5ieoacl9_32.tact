struct InnerStr {
    s: String;
    f: Bool;
}

contract JustOne {
    field: InnerStr;

    init() {
        self.field = InnerStr{s:"Hello", f:true};
    }
}