struct DefaultAndOptionals {
    x: Int = 5;
    y: String?;
    z: Bool?;
}

contract MixDefaults {
    info: DefaultAndOptionals;
    
    init() {
        self.info = DefaultAndOptionals{};
    }
}