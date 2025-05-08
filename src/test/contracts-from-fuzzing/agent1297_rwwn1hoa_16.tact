struct Mix {
    a: Int;
    b: Bool;
    c: String;
}

contract InitSetter {
    val: Mix;

    init() {
        self.val = Mix{
            a: 42,
            b: true,
            c: "hello",
        };
    }
}