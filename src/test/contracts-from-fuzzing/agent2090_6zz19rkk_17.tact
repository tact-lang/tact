struct InnerMost {
    val: Int;
}

message(7) Middle {
    inside: InnerMost;
    flag: Bool;
}

struct OuterWrapper {
    nestedMsg: Middle;
    label: String?;
}

contract MultiNestOpt {
    data: OuterWrapper?;

    init() {
        self.data = null;
    }
}