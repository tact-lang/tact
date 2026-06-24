struct DefaultsNested {
    i: Int = 7;
    s: String = "hi";
    o: Bool?;
}

contract DefaultsContract {
    data: DefaultsNested;

    init() {
        self.data = DefaultsNested{ o: null };
    }
}