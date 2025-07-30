struct OptionalStruct {
    optInner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool?;
    z: String;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            optInner: InnerStruct{
                x: 3,
                y: null,
                z: "test"
            }
        };
    }
}