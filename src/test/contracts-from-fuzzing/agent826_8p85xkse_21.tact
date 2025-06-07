message MsgInner { v: Int; }
struct StructMiddle { m: MsgInner; }
message MsgOuter { s: StructMiddle; }

contract TestContract {
    data: MsgOuter = MsgOuter{ s: StructMiddle{ m: MsgInner{ v: 1 } } };

    init() {
        self.data = MsgOuter{ s: StructMiddle{ m: MsgInner{ v: 2 } } };
    }
}
