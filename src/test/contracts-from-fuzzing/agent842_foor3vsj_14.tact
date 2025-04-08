struct InnerInsideInner {
    foo: Int;
    bar: Bool?;
    nest: String?;
}

struct Middle {
    left: InnerInsideInner;
    right: InnerInsideInner?;
}

contract MidOpt {
    data: Middle;

    init() {
        self.data = Middle{
            left: InnerInsideInner{ foo: 1, bar: null, nest: null },
            right: null
        };
    }

    receive() {
        let _ = self.data;
    }
}