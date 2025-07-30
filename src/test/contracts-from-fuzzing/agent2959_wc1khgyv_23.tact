struct WithDefaults {
    x: Int = 5;
    y: Bool = false;
    z: String = "hello";
}

contract DefaultsAreConstants {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{x:10,y:true,z:"bye"};
    }
}