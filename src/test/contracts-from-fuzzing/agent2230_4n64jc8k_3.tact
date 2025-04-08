struct OptionalDeep {
    innerOpt: SimpleStruct?;
    valOpt: Int?;
}

struct SimpleStruct { x: Int; y: Int; }

contract OptionalDeepContract {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            innerOpt: SimpleStruct{ x: 10, y: 20 },
            valOpt: null
        };
    }
}