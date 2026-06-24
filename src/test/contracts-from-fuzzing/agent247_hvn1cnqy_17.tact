struct Mix {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    str: String;
    optBool: Bool?;
}

contract MixedAll {
    data: Mix;

    init() {
        self.data = Mix{
            intVal:42,
            boolVal:true,
            optInt:null,
            str:"hi",
            optBool:false
        };
    }
}