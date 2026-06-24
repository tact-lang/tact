struct OptionalStruct {
    a: Int?;
    b: Bool?;
}

struct HolderStruct {
    core: OptionalStruct?;
    value: Int;
}

contract OptionalStructInStruct {
    data: HolderStruct;

    init() {
        self.data = HolderStruct{
            core: null,
            value: 123,
        };
    }
}