// optional struct with some default fields set, some not
struct OptDefaults {
    x: Int?;
    y: String?;
    z: Bool?;
}

contract OptDefaultsState {
    store: OptDefaults;
    init() {
        self.store = OptDefaults{ x:null, y:"hi", z:null };
    }
}
