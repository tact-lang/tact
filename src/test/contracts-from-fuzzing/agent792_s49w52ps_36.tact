struct DeepType {
    foo: Int;
    bar: Int?;
    baz: Bool;
    qux: Bool?;
    addr: Address;
    addrOpt: Address?;
    str: String;
    strOpt: String?;
    c: Cell;
    cOpt: Cell?;
}

struct Container1 {
    nested: DeepType;
}

struct Container2 {
    nested: Container1;
}

contract DeepNest {
    field: Container2;

    init() {
        self.field = Container2{
            nested: Container1{
                nested: DeepType{
                    foo:1,bar:null,baz:true,qux:null,
                    addr:myAddress(),addrOpt:null,
                    str:"hi",strOpt:null,
                    c:emptyCell(),cOpt:null
                }
            }
        };
    }
}