struct DeepOptionDefault {
    inn: Inner?;
}

struct Inner {
    x: Int = 5;
    y: String = "sec";
}

contract DefaultsDeep {
    data: DeepOptionDefault;

    init() {
        self.data = DeepOptionDefault{
            inn: null
        };
    }
}