struct MsgA { v: Int }
struct MsgB { v: MsgA }

contract StructInStruct {
    item: MsgB;

    init() {
        self.item = MsgB{ v: MsgA{ v: 42 } };
    }
}