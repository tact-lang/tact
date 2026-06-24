struct HasEmptyString {
    s: String;
    n: Int;
}

contract EmptyStringTest {
    data: HasEmptyString = HasEmptyString{ s: "", n: 0 };

    init() {
        self.data = HasEmptyString{ s: "nonempty", n: 1 };
    }
}
