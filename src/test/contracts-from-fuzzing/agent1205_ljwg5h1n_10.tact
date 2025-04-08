struct MixedNested {
    basic: BasicStruct;
    opt: OptionalStruct?;
}

struct BasicStruct {
    x: Int;
    y: Bool;
}

struct OptionalStruct {
    flag: Bool;
}

contract TestContract {
    mixed: MixedNested;
    
    init() {
        self.mixed = MixedNested{
            basic: BasicStruct{x: 1, y: true},
            opt: null
        };
    }
}