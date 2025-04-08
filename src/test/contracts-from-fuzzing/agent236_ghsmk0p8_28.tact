message(1) MsgOne { x: Int }
message(2) MsgTwo { y: Bool }

contract TestContract {
    m1: MsgOne;
    m2: MsgTwo;

    init() {
        self.m1 = MsgOne{x:123};
        self.m2 = MsgTwo{y:true};
    }
}