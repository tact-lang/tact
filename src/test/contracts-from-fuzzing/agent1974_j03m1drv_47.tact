struct WithDefaults {
    a: Int = 7;
    b: Bool = true;
    c: Int?; 
}

contract DefaultContract {
    field: WithDefaults;

    init() {
        self.field = WithDefaults{
            c: null
        };
    }
}
