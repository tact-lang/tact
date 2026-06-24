message(0x1) Msg { x: Int }

struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    inr: Inner;
    txt: String;
}

contract MixedFields {
    val: Int = 5;
    flag: Bool = true;
    note: String = "hi";
    optInt: Int? = null;
    s: Outer;
    m: Msg;

    init() {
        self.s = Outer{
            inr: Inner { a: 7, b: null },
            txt: "nest"
        };
        self.m = Msg { x: 42 };
    }
}