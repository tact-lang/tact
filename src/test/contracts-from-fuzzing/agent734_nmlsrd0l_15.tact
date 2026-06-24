struct Strings {
    a: String;
    b: String;
    c: String;
}

contract StringStructTest {
    data: Strings;

    init() {
        self.data = Strings{
            a: "one",
            b: "two",
            c: "three",
        };
    }
}
