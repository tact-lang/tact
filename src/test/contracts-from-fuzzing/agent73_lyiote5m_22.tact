struct MultipleOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    val: MultipleOptionals;

    init() {
        self.val = MultipleOptionals{ a: null, b: null, c: null };
    }
}