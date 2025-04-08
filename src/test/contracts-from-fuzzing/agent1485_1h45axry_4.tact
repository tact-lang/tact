struct Nested {
    x: Int;
    flag: Bool;
}

contract StructHolder {
    val: Nested;

    init() {
        self.val = Nested{ x: 21, flag: true };
    }
}