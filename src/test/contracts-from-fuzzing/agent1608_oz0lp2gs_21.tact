struct OptString {
    a: String?;
    b: String?;
    c: String?;
    d: String?;
    e: String?;
}

contract OptStringStorage {
    val: OptString;

    init() {
        self.val = OptString{
            a: "foo",
            b: null,
            c: "",
            d: "bar",
            e: null
        };
    }
}