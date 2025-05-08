struct Flat {
    num: Int;
    text: String;
}

contract MixedTopLevelFields {
    intVal: Int;
    optAddr: Address?;
    flatVal: Flat;
    optFlat: Flat?;

    init() {
        self.intVal = 42;
        self.optAddr = null;
        self.flatVal = Flat{ num: 1, text: "hi" };
        self.optFlat = null;
    }
}