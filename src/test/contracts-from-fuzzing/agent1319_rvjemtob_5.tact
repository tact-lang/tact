struct BigDefaultStruct {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Bool?;
    e: Int?;
    f: String?;
}

contract BigDefaultsTest {
    s: BigDefaultStruct;

    init() {
        self.s = BigDefaultStruct{};
    }
}