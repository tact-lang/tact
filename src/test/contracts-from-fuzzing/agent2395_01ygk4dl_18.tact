struct Arranged {
    flag: Bool;
    str: String;
    val: Int;
    optInt: Int?;
    optStr: String?;
    nested: InnerStruct;
}

struct InnerStruct {
    innerFlag: Bool;
    innerVal: Int;
}

contract ManyTypes {
    store: Arranged;

    init() {
        self.store = Arranged{
            flag: true,
            str: "test",
            val: 100,
            optInt: null,
            optStr: null,
            nested: InnerStruct{ innerFlag:false, innerVal:42 }
        };
    }
}
