struct MixedOptDefault {
    x: Int = 1;
    y: Int? = null;
    z: Bool?;
}

contract MixedOptDefContract {
    data: MixedOptDefault;

    init() {
        self.data = MixedOptDefault{};
    }
}