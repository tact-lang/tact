struct EmptyOptContainer {
    v: Int?;
}

contract NullInInitTest {
    field: EmptyOptContainer;
    init() {
        self.field = EmptyOptContainer{
            v: null
        };
    }
}