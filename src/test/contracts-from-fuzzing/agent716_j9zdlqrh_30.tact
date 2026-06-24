// Undocumented edge: message structs can be persistent variables?
message(101) MsgStruct {
    x: Int;
    y: Int;
}

contract MessageAsField {
    m: MsgStruct;

    init() {
        self.m = MsgStruct{ x: 1, y: 2 };
    }
}