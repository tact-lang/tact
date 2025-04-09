struct InnerDefaultOpt {
    message: String? = "abc";
}

struct Outer {
    sub: InnerDefaultOpt;
}

contract DefaultedNestedOpt {
    data: Outer;

    init() {
        self.data = Outer{
            sub: InnerDefaultOpt{}, // rely on implicit default for message
        };
    }
}