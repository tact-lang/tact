struct LargeNested {
    s1: Int?;
    s2: Bool?;
    s3: String?;
    s4: Address?;
    s5: Cell?;
}

contract LargeNestedTest {
    ln1: LargeNested;
    ln2: LargeNested;
    ln3: LargeNested;

    init() {
        self.ln1 = LargeNested{};
        self.ln2 = LargeNested{};
        self.ln3 = LargeNested{};
    }
}
