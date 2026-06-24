struct OptionalsNested {
    inner: InnerOptionals?;
}

struct InnerOptionals {
    valA: Int?;
    valB: Bool?;
}

contract OptionalWithinOptionalStruct {
    data: OptionalsNested;

    init() {
        self.data = OptionalsNested{
            inner: InnerOptionals{
                valA: null,
                valB: true
            }
        };
    }
}