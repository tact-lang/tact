struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract TestContract {
    val: OptionalStruct = OptionalStruct{
        a:null,b:null,c:null,d:null,e:null,f:null
    };
}