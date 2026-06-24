struct NestedOpt {
    info: Info?;
}

struct Info {
    number: Int;
    note: String?;
}

contract StorageTest {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            info: Info{
                number: 1,
                note: null
            }
        };
    }
}