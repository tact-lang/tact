struct OptNested {
    inn: Int?;
}

contract OptNestedHolder {
    s: OptNested;
    init() {
        self.s = OptNested{ inn: null };
    }
}