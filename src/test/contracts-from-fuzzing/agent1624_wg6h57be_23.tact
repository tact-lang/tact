struct InnerOpt { foo: Int; }

struct ComboStruct {
    simpleInt: Int;
    optInt: Int?;
    boolVal: Bool;
    optStr: String?;
    innerOpt: InnerOpt?;
}

contract MixedComboContract {
    data: ComboStruct;

    init() {
        self.data = ComboStruct{
            simpleInt: 100,
            optInt: null,
            boolVal: true,
            optStr: null,
            innerOpt: null,
        };
    }
}