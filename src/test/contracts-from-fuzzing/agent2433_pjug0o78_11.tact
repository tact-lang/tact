contract DefaultedStructFields {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}

struct WithDefaults {
    x: Int = 5;
    y: String = "hello";
    z: Bool = false;
    o: Int?; // implicitly null
}