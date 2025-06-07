struct OptNested {
    flag: Bool;
    nestedOpt: InnerOpt?;
}

struct InnerOpt {
    number: Int;
    txt: String;
}

contract OptionalNested {
    data: OptNested;

    init() {
        self.data = OptNested{
            flag: true,
            nestedOpt: null
        };
    }
}
