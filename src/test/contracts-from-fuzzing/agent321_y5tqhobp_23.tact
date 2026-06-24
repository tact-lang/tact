struct DefaultVsInit {
    x: Int = 1;
    y: Bool;
    z: String = "abc";
}

contract MixedInitDefaults {
    data: DefaultVsInit;
    init() {
        self.data = DefaultVsInit{
            y: true,
            // no need to specify x or z, defaults used
        };
    }
}