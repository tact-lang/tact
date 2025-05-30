struct LongStruct {
    a: Int;
    b: Int;
    c: Int;
    d: String;
    e: String;
    f: String;
    g: Address;
    h: Address;
    i: Bool;
    j: Bool;
    k: Int?;
    l: String?;
    m: Address?;
    n: Bool?;
}

contract LongStructStorage {
    record: LongStruct;

    init() {
        self.record = LongStruct{
            a:1,b:2,c:3,d:"d",e:"e",f:"f",g:myAddress(),h:myAddress(),i:true,j:false,k:null,l:null,m:null,n:true
        };
    }
}