struct MultiScenario {
    intVal: Int;
    intSmall: Int as uint8;
    flag: Bool = true;
    maybeStr: String?;
}

contract SpecialStructTest {
    data: MultiScenario;

    init() {
        self.data = MultiScenario {
            intVal: 257,
            intSmall: 255,
            maybeStr: "hi"
        };
    }
}