struct Level4 {
    L4: Int;
}

struct Level3 {
    L3: Level4;
}

struct Level2 {
    L2: Level3;
}

struct Level1 {
    L1: Level2;
}

message DeepMsg {
    Msg: Level1;
}

contract TestDeepNested {
    receive(msg: DeepMsg) {
        let x = msg.Msg.L1.L2.L3.L4;
    }
}
