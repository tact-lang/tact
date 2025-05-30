struct OptionalPrimitiveStruct {
    s: SimpleStruct?;
}

struct SimpleStruct {
    x: Int;
    y: Bool;
}

contract OptionalStructStorage {
    state: OptionalPrimitiveStruct;

    init() {
        self.state = OptionalPrimitiveStruct{
            s: SimpleStruct{
                x: 5,
                y: true
            }
        };
    }
}