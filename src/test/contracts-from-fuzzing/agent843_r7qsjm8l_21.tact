struct LargeStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;
    m: Int;
    n: Bool;
    o: String;
}

contract LargeNestedField {
    info: LargeStruct;

    init() {
        self.info = LargeStruct{
            a:1,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"",
            g:null,h:null,i:null,j:null,k:null,l:null,m:2,n:false,o:"x"
        };
    }
}