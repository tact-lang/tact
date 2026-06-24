struct OptionalNested {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract OptNestTest {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{ i:null, b:null, s:null };
    }
}