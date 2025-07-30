struct Data {
    intVal: Int;
    strVal: String;
    boolVal: Bool;
}

contract DefaultsTest {
    data: Data = Data{ intVal: 5, strVal: "hello", boolVal: true };

    init() {
        self.data = Data{ intVal: 10, strVal: "hi", boolVal: false };
    }
}