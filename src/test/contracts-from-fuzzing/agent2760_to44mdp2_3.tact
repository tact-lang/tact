struct OptionalLayer {
    str: String?;
    intVal: Int?;
    flag: Bool?;
}

contract OptVars {
    var1: OptionalLayer;

    init() {
        self.var1 = OptionalLayer{
            str: null,
            intVal: null,
            flag: true
        };
    }
}