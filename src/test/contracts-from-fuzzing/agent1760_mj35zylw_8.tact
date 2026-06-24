struct Sub {
    i: Int;
    t: String;
    b: Bool;
    s: String;
}

contract InitPartial {
    val: Sub;

    init() {
        self.val = Sub{
            i: 123,
            t: "test",
            b: true,
            s: ""
        };
    }
}