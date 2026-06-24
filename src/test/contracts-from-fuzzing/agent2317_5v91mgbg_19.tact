struct Mix {
    intVal: Int = 1;
    boolVal: Bool = true;
    strVal: String = "x";
    optVal: Int?;
}

contract MixFields {
    f: Mix;

    init() {
        self.f = Mix{intVal: 2, boolVal: false, strVal: "y", optVal: null};
    }
}