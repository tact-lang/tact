struct Sub {
    val1: Int = 5;
    val2: Bool = false;
}

struct Top {
    s: Sub?;
    title: String = "hello";
}

contract PartialNestedDefaults {
    state: Top;

    init() {
        self.state = Top{
            // omit s, defaults to null
            // omit title, defaults to "hello"
        };
    }
}
