struct EmptyDefaults {
    x: Int;
    y: Bool;
}

contract DefaultsInitContract {
    foo: EmptyDefaults;

    init() {
        self.foo = EmptyDefaults{ x:0, y:false };
    }
}