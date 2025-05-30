struct SOpt {
    foo: Bool?;
    bar: Int?;
}

struct Container {
    data: SOpt;
    maybeOther: SOpt?;
    num: Int;
    text: String?;
}

contract OptInOut {
    cont: Container;

    init() {
        self.cont = Container{
            data: SOpt{ foo: null, bar: null },
            maybeOther: null,
            num: 42,
            text: null,
        };
    }
}