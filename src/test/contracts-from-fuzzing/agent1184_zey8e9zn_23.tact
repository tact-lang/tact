struct Combination {
    intVal: Int;
    strVal: String?;
    boolVal: Bool;
}

contract ComboTest {
    data: Combination;

    init() {
        self.data = Combination{
            intVal: 42,
            strVal: null,
            boolVal: false
        };
    }
}