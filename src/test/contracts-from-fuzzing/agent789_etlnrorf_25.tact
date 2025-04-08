message InnerEmpty {}

message Outer {
    e: InnerEmpty;
}

contract EmptyMsgInsideMsg {
    x: Outer;
    init() {
        self.x = Outer{
            e: InnerEmpty{}
        };
    }
}