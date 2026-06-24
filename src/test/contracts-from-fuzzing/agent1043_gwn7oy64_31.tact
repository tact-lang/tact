struct JustOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract TestContract {
    jo: JustOptionals;

    init() {
        self.jo = JustOptionals{ a: null, b: null, c: null };
    }
}