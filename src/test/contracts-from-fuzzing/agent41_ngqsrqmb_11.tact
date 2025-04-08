struct OptionalLevels {
    level1: Int?;
    level2: String?;
}

struct WrapOptional {
    inner: OptionalLevels?;
    flag: Bool;
}

contract OptLvlContract {
    payload: WrapOptional;
    init() {
        self.payload = WrapOptional{
            inner: null,
            flag: true,
        };
    }
}