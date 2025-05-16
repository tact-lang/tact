struct DefaultsMix {
    intVal: Int = 5;
    boolVal: Bool = true;
    strVal: String = "hi";
    optVal: Int?;
}

contract DefaultsContract {
    x: DefaultsMix = DefaultsMix{ optVal: null };

    init() {
        self.x = DefaultsMix{ intVal: 100, boolVal: false, strVal: "yo", optVal: 50 };
    }

    receive() {
        let _ = self.x;
    }
}