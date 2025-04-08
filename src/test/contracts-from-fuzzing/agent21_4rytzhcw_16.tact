struct HasDefault {
    x: Int = 5;
}

contract OverrideDefault {
    data: HasDefault;

    init() {
        self.data = HasDefault{
            x: 42
        };
    }
}
