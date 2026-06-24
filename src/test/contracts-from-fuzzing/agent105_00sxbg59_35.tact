struct BoolLayer1 { b: Bool }
struct BoolLayer2 { nested: BoolLayer1 }
struct BoolLayer3 { nested: BoolLayer2 }
contract BoolDeepNest {
    storage: BoolLayer3;

    init() {
        self.storage = BoolLayer3{
            nested: BoolLayer2{
                nested: BoolLayer1{
                    b: false,
                },
            },
        };
    }
}