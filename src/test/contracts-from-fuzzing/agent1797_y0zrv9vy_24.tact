struct DefaultsAndOptions {
    a: Int = 5;
    b: Bool?;
    c: String = "hi";
    d: Int?;
}

contract Test {
    dao: DefaultsAndOptions;
    init() {
        self.dao = DefaultsAndOptions{ b: null, d: null };
    }
}