struct WithDefaults {
    x: Int = 1;
    y: Bool = true;
    z: String = "default";
    o: Int?; // implicitly default null
}

contract DefaultsInStructTest {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            
        };
    }
}