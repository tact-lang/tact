struct HasString {
    strVal: String;
    intVal: Int;
    boolVal: Bool;
}

contract MixedTypes {
    data: HasString;
    init() {
        self.data = HasString{ strVal: "test", intVal: 42, boolVal: true };
    }
}