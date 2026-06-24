struct OptionalInnerStruct {
    data: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract OptionalInnerStructContract {
    val: OptionalInnerStruct;

    init() {
        self.val = OptionalInnerStruct{
            data: InnerStruct{
                x: 7,
                y: true,
            }
        };
    }
}