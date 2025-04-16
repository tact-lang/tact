struct AllOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ImplicitNulls {
    o: AllOptionals;

    init() {
        self.o = AllOptionals{};
    }
}
