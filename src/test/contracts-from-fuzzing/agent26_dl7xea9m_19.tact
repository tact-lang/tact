struct OptionInner {
    val: Int?;
}

struct OptionOuter {
    inner: OptionInner?;
}

contract DoublyOptional {
    field: OptionOuter;

    init() {
        self.field = OptionOuter{
            inner: null
        };
    }
}