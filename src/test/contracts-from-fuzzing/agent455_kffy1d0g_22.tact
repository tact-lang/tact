struct UseString {
    a: String;
    b: String?;
}

contract StringsAreFun {
    s: UseString;

    init() {
        self.s = UseString{
            a: "abc",
            b: null,
        };
    }
}