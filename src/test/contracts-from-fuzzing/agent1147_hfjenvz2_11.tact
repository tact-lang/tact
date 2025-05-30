struct Complex {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    nested: Nested;
}

struct Nested {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
}

contract TestContract {
    c: Complex;

    init() {
        self.c = Complex{
            intVal: 1,
            boolVal: true,
            strVal: "s",
            optInt: null,
            optBool: null,
            optStr: "k",
            nested: Nested{
                f1:2,
                f2:false,
                f3:"x",
                f4:null,
                f5:true,
                f6:null
            },
        };
    }
}