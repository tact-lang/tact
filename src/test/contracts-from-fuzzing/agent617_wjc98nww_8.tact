struct EmptyDefaults {
    num: Int;
    optVal: Int?;
}

contract Defaults {
    s: EmptyDefaults;
    init() {
        // no default assignments in struct; assign all explicitly
        self.s = EmptyDefaults{
            num: 100,
            optVal: null
        };
    }
}
