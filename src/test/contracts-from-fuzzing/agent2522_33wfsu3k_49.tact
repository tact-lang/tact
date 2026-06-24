struct ManyNestedOptional {
    p: Int?;
    q: Bool?;
    r: Address?;
    s: String?;
    t: Int?;
}

contract ManyNestedTest {
    data: ManyNestedOptional?;

    init() {
        self.data = null;
    }
}