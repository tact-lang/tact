struct Complex {
    intVal: Int = 0;
    boolVal: Bool = false;
    optInt: Int?;
    optBool: Bool?;
    strVal: String = "s";
}

contract ComplexStorage {
    data: Complex;

    init() {
        self.data = Complex{
            intVal:9,
            boolVal:true,
            optInt:null,
            optBool:false,
            strVal:"x"
        };
    }
}