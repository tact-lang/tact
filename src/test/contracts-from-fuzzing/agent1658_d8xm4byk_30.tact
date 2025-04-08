struct TypeMix {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    sl: Slice;
    c: Cell;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;
    osl: Slice?;
    oc: Cell?;
}

contract StorageTest {
    m: TypeMix;

    init() {
        self.m = TypeMix{
            i:1,b:true,s:"s",a:myAddress(),sl:emptyCell().asSlice(),c:emptyCell(),
            oi:null,ob:null,os:null,oa:null,osl:null,oc:null
        };
    }
}