struct Mix2 {
    s: String;
    b: Bool;
    i: Int;
    oi: Int?;
}

contract Mix2Test {
    val: Mix2;
    init() {
        self.val = Mix2{
            s: "hi",
            b: true,
            i: 99,
            oi: 199
        };
    }
}