struct Meta { key: String; value: Int?; }

message(1234) MetaMsg {
    meta: Meta;
    flag: Bool?;
}

contract Complex {
    m1: MetaMsg?;
    m2: MetaMsg?;

    init() {
        self.m1 = null;
        self.m2 = null;
    }

    receive() {}
}