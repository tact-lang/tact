struct SText {
    t1: String;
    t2: String?;
    t3: String;
    t4: String?;
}

contract TestContract {
    s: SText;
    init() {
        self.s = SText{
            t1: "foo",
            t2: null,
            t3: "bar",
            t4: "baz",
        };
    }
}