struct StringsMix {
    s1: String;
    s2: String;
    optS: String?;
}

contract StringFields {
    val: StringsMix;

    init() {
        self.val = StringsMix{
            s1: "foo",
            s2: "bar",
            optS: null,
        };
    }

    receive() {
        let v = self.val;
    }
}