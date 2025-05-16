struct Info {
    id: Int = 42;
    name: String;
}

contract OptDefDemo {
    maybe: Int?;
    details: Info;

    init() {
        self.maybe = null;
        self.details = Info{ name: "hi" };
    }
}
