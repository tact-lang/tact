struct BigStruct {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: Bool; g: Bool; h: Bool; i: Bool; j: Bool;
    k: Address; l: Address; m: Address; n: Address;
    o: Int?; p: Bool?; q: Address?;
}

contract ManyFields {
    data: BigStruct;
    init() {
        self.data = BigStruct{
            a:1,b:2,c:3,d:4,e:5,
            f:true,g:false,h:true,i:false,j:true,
            k:myAddress(),l:myAddress(),m:myAddress(),n:myAddress(),
            o:null,p:null,q:null
        };
    }
}