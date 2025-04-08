struct A {
    flag: Bool;
    text: String;
}

contract OptionalFields {
    optA: A?;
    optInt: Int?;
    optString: String?;
    boolVal: Bool;
    intVal: Int;
    strVal: String;

    init() {
        self.optA = null;
        self.optInt = 5;
        self.optString = null;
        self.boolVal = true;
        self.intVal = 10;
        self.strVal = "x";
    }
}
