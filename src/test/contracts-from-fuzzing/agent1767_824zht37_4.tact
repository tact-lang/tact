struct DefaultsAndOpts {
    a: Int = 10;
    b: Bool = true;
    c: String = "hi";
    d: Int?;                
    e: Bool?;
    f: String?;
}

contract DefaultsOptTest {
    s: DefaultsAndOpts;

    init() {
        self.s = DefaultsAndOpts{};
    }
}