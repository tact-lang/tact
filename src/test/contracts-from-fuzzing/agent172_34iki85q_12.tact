struct AllOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Bool?;
    f: Bool?;
    g: String?;
    h: String?;
}

contract DefaultsTest {
    record: AllOptional;

    init() {
        self.record = AllOptional{}; // rely on implicit nulls for all optionals
    }
}