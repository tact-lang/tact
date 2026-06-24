struct Inner {
    a: Int;
    b: String?;
}

struct Outer {
    inr: Inner;
    text: String;
    flag: Bool?;
}

contract Test {
    dat: Outer = Outer{
        inr: Inner{a: 5, b: null},
        text: "hello",
        flag: true
    };
    init() {}
}