struct MixedTypes {
    intVal: Int = 10;
    boolVal: Bool = true;
    strVal: String = "hello";
}

contract MixedFields {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{};
    }
}