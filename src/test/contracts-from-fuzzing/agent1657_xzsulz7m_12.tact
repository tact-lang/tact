struct OptionalDeep {
    one: Int?;
    two: Level2?;
}

struct Level2 {
    three: Bool?;
    four: Address?;
}

contract TestContract {
    data: OptionalDeep;
    init() {
        self.data = OptionalDeep{
            one: null,
            two: Level2{
                three: true,
                four: null
            }
        };
    }
}