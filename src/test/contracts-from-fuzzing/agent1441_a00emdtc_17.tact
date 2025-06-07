struct LongStrings {
    a: String;
    b: String;
    c: String;
}

contract StringsAndInt {
    data: LongStrings;

    init() {
        self.data = LongStrings{
            a: "hello",
            b: "world",
            c: "!"
        };
    }

    receive() {
        self.data = LongStrings{
            a: "foo",
            b: "bar",
            c: "baz"
        };
    }
}