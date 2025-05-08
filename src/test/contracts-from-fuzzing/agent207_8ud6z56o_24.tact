message(0x10) InnerMsg {
    foo: Int = 99;
    bar: String = "bar";
}

struct Outer {
    m: InnerMsg;
    comment: String;
}

contract TestContract {
    o: Outer = Outer{
        comment: "ok",
        m: InnerMsg{},
    };
}