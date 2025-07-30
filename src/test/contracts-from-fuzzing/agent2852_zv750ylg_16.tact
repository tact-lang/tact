struct BigStruct {
    a: Int; b: Bool; c: String; d: Address;
    e: Int; f: Bool; g: String; h: Address;
    i: Int; j: Bool; k: String; l: Address;
    m: Int; n: Bool; o: String; p: Address;
}

contract LargeStorage {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a:1,b:true,c:"c",d:myAddress(),e:2,f:false,g:"g",h:myAddress(),
            i:3,j:true,k:"k",l:myAddress(),m:4,n:false,o:"o",p:myAddress()
        };
    }
}