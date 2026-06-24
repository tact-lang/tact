struct Numbered {
    one: Int;
    two: Int;
    three: Int;
    four: Int;
}

contract StructWithDefaults {
    val: Numbered;
    init() {
        self.val = Numbered{
            one: 1,
            two: 2,
            three: 3,
            four: 4,
        };
    }
}