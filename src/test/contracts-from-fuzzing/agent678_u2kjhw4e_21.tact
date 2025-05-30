struct BigStruct {
    a: Int;    b: Bool;   c: String; d: Address;
    e: Int?;  f: Bool?;  g: String?; h: Address;
    i: Int;   j: Bool;   k: String; l: Address;
    m: Int?;  n: Bool?;  o: String?; p: Address;
}
contract TestContract {
    bstruct: BigStruct;
    init() {
        self.bstruct = BigStruct{
            a:1, b:true, c:"x", d:myAddress(),
            e:null, f:false, g:null, h:myAddress(),
            i:3, j:true, k:"y", l:myAddress(),
            m:null, n:true, o:null, p:myAddress()
        };
    }
}