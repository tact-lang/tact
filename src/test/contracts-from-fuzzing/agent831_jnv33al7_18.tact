struct DeepStruct {
    a: Int;
    b: Int;
    c: Int;
    d: String;
    e: Bool;
    f: Address;
    g: Bool;
    h: Int;
    i: String;
    j: Bool;
    k: Address;
    l: Bool;
}

contract StructWithManyFields {
    data: DeepStruct;
    init() {
        self.data = DeepStruct{
            a:1,b:2,c:3,d:"a",e:true,f:myAddress(),g:false,h:4,i:"b",j:true,k:myAddress(),l:false
        };
    }
}