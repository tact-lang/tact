message(0x1) MsgLevel3 {
    z: Int;
}

struct Level2 {
    innerMsg: MsgLevel3;
}

contract StructWithNestedMsg {
    rec: Level2;

    init() {
        self.rec = Level2{
            innerMsg: MsgLevel3{ z: 10 }
        };
    }
}