struct OptionalStruct {
    optField: Int?;
    nestedOpt: NestedOptStruct?;
}

struct NestedOptStruct {
    flag: Bool;
    value: Int;
}

contract OptionalContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            optField: null,
            nestedOpt: null
        };
    }

    receive() {
        if (self.data.optField != null) {
            let _ = self.data.optField!!;
        }
    }
}