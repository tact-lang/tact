struct DefaultsShadow {
    val: Int = 42;
}

contract ShadowOverwrite {
    x: DefaultsShadow;

    init() {
        self.x = DefaultsShadow{ val: 100 };
    }
}