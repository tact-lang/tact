struct OptionalInner {
    x: Int?;
    y: Bool?;
}

struct Middle {
    inner: OptionalInner?;
    flag: Bool;
}

contract TestContract {
    middleStruct: Middle;

    init() {
        self.middleStruct = Middle{
            inner: OptionalInner{
                x: 32,
                y: true
            },
            flag: false
        };
    }
}
