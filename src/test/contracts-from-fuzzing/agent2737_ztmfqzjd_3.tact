struct LargeStruct {
    a: Int; b: Bool; c: String; d: Address; e: Int;
    f: Bool; g: String; h: Address; i: Int; j: Bool;
    k: String; l: Address; m: Int; n: Bool; o: String;
    p: Address; q: Int; r: Bool; s: String; t: Address;
}

contract LargeStructTest {
    field: LargeStruct;

    init() {
        self.field = LargeStruct{
            a:0,b:true,c:"",d:myAddress(),
            e:1,f:false,g:"a",h:myAddress(),
            i:2,j:true,k:"b",l:myAddress(),
            m:3,n:false,o:"c",p:myAddress(),
            q:4,r:true,s:"d",t:myAddress()
        };
    }
}