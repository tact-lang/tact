struct MultiTypes {
    id: Int;
    active: Bool;
    label: String;
}

contract MixedFields {
    intField: Int;
    boolField: Bool;
    strField: String;
    structField: MultiTypes;
    optionalStruct: MultiTypes?;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.strField = "hello";
        self.structField = MultiTypes{ id: 42, active: false, label: "hi" };
        self.optionalStruct = null;
    }
}