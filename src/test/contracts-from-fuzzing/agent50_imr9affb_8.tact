struct SingleField {
    count: Int;
}

contract JustOne {
    val: SingleField;

    init() {
        self.val = SingleField{count: 123};
    }
}