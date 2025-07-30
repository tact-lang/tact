struct DefaultsVsInit {
    x: Int = 5;
    y: Bool = false;
    z: String = "hello";
}

contract TestContract {
    data: DefaultsVsInit;

    init() {
        self.data = DefaultsVsInit{
            x: 42,
            y: true,
            z: "world",
        };
    }
}
