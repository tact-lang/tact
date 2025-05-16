struct InnerOpt {
    flag: Bool;
    value: Int;
}

struct OuterOpt {
    nestedOpt: InnerOpt?;
    text: String;
}

contract OptionStructInContract {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            nestedOpt: null,
            text: "opt"
        };
    }
}