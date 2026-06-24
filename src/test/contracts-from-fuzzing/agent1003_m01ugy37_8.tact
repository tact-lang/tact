struct OptionalStruct {
    s: InnerStruct?;
}

struct InnerStruct {
    val: Int;
}

contract OptStructStorage {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            s: InnerStruct{ val: 99 }
        };
    }
}