struct StringsOnly {
    a: String;
    b: String;
    c: String;
}

contract StringsTest {
    data: StringsOnly = StringsOnly{ a:"a", b:"b", c:"c" };

    receive() {
        self.data = StringsOnly{ a:"x", b:"y", c:"z" };
    }
}