struct InnerMost {
    value: Int;
}

struct InnerOpt {
    inner: InnerMost?;
    flag: Bool?;
}

struct Composite {
    part: InnerOpt;
    number: Int;
}

contract OptionalNested {
    data: Composite;

    init() {
        self.data = Composite{
            part: InnerOpt{
                inner: null,
                flag: null,
            },
            number: 7,
        };
    }
}