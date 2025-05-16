struct Inner {
    num: Int;
    opt: Int?;
    txt: String;
}

struct Outer {
    first: Inner;
    maybe: Inner?;
    flag: Bool;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            first: Inner{num: 1, opt: null, txt: "x"},
            maybe: null,
            flag: true
        };
    }
}