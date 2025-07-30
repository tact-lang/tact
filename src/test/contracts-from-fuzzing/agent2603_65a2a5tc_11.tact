message(1) EmptyMessage {}

struct MesStructWrapped {
    m: EmptyMessage;
    num: Int;
}

contract StructWithMessage {
    field: MesStructWrapped;
    init() {
        self.field = MesStructWrapped{
            m: EmptyMessage{},
            num: 100,
        };
    }
}
