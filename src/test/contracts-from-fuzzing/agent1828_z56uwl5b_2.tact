struct Inner {
    flag: Bool;
    txt: String;
}

struct Outer {
    num8: Int as uint8;
    num16: Int as int16;
    optInner: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            num8: 1,
            num16: -2,
            optInner: Inner{
                flag: false,
                txt: "nested"
            }
        };
    }
}