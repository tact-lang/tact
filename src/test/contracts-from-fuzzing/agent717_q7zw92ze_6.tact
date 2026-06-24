struct MixTypes {
    i: Int;
    b: Bool;
    s: String;
}

contract MixFieldsTest {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    nested: MixTypes;

    init() {
        self.intVal = 42;
        self.boolVal = true;
        self.strVal = "hi";
        self.nested = MixTypes{i:1, b:false, s:"x"};
    }
}