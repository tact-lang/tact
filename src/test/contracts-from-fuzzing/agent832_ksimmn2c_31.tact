struct DefaultsVsInit {
    a: Int = 5;
    b: Bool = false;
    c: String = "default";
}

contract DefaultsVsInitContract {
    data: DefaultsVsInit;

    init() {
        self.data = DefaultsVsInit{
            a: 10,
            b: true,
            c: "overridden",
        };
    }
}