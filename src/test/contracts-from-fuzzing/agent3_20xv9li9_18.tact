message(7) MM {
    foo: Int;
}

struct NestedOptMsg {
    msg: MM?;
}

struct LevelTop {
    nested: NestedOptMsg?;
}

contract NestedOptionalMessages {
    store: LevelTop;

    init() {
        self.store = LevelTop{
            nested: NestedOptMsg{
                msg: MM{ foo: 22 }
            }
        };
    }
}