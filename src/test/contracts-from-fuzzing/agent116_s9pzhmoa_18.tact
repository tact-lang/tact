struct OptionNested {
    inner: Int?;
}

struct OptionDeep2 {
    inner: OptionNested?;
}

contract MultiLevelOptionals {
    data: OptionDeep2?;

    init() {
        self.data = null;
    }
}