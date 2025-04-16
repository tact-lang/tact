struct RecStruct {
    val: Int;
    opt: Int?;
    nested: NestedRec;
}

struct NestedRec {
    str: String;
    flag: Bool;
    inn: InnermostRec;
}

struct InnermostRec {
    subopt: Int?;
}

contract TestContract {
    rec: RecStruct;

    init() {
        self.rec = RecStruct{
            val: 42,
            opt: null,
            nested: NestedRec{
                str:"aaa",
                flag:true,
                inn: InnermostRec{subopt:null}
            }
        };
    }
}
