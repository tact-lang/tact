struct S {
    a: Int;
    b: String;
    c: Bool;
}

contract FieldsOrder {
    s: S;
    val: Int;
    flag: Bool;
    text: String;

    init() {
        self.s = S{
            a: 1,
            b: "boo",
            c: true
        };
        self.val = 2;
        self.flag = false;
        self.text = "hi";
    }
}