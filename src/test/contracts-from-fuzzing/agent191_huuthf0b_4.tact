struct OptionalDeep {
    fld: Level1?;
}

struct Level1 {
    nested: Level2?;
}

struct Level2 {
    value: Int?;
}

contract TestContract {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            fld: Level1{
                nested: Level2{
                    value: null
                }
            }
        };
    }
}