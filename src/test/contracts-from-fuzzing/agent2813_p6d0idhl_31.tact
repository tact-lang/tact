struct WithVariousPrimitives {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    cl: Cell;
    sl: Slice;
    bu: Builder;
}

struct ContainerWrap {
    field: WithVariousPrimitives;
}

contract TestVariousNested {
    storage: ContainerWrap;

    init() {
        self.storage = ContainerWrap{
            field: WithVariousPrimitives{
                i: 1,
                b: true,
                s: "hi",
                addr: myAddress(),
                cl: emptyCell(),
                sl: emptyCell().asSlice(),
                bu: beginCell()
            }
        };
    }
}
