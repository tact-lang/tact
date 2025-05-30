struct S1 {
    x: Int;
}

message Msg1 {
    s: S1;
}

contract StructInsideMsg {
    m: Msg1;
    init() {
        self.m = Msg1{
            s: S1{x:123}
        };
    }
}