struct DoubleNested {
    foo: Inner1;
    bar: Inner2;
}

struct Inner1 {
    val: Int;
    flag: Bool;
}

struct Inner2 {
    text: String;
    num: Int;
}

contract MultiNested {
    val: DoubleNested;

    init() {
        self.val = DoubleNested{
            foo: Inner1{ val: 1, flag: false },
            bar: Inner2{ text: "abc", num: 2 }
        };
    }
}