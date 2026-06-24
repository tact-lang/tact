struct WithOpcodes {
    m1: MsgA;
    m2: MsgB;
}

message(1) MsgA { x:Int; }
message(2) MsgB { y:Bool; }

contract WrappedMsgs {
    wrap: WithOpcodes;
    init() {
        self.wrap = WithOpcodes{
            m1: MsgA{x:10},
            m2: MsgB{y:false}
        };
    }
}