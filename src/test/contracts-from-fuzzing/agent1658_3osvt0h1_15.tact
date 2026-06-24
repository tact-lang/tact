struct OptNested {
    intVal: Int?;
    strVal: String?;
    boolVal: Bool?;
}

struct HoldsOptNested {
    nested: OptNested;
}

contract OptionalInStructInStorage {
    hold: HoldsOptNested;

    init() {
        self.hold = HoldsOptNested{
            nested: OptNested{
                intVal: null,
                strVal: null,
                boolVal: null
            }
        };
    }
}