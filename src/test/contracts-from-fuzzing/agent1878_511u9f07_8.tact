struct BigStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Bool;
    h: Bool;
    i: String;
    j: String;
    k: Cell;
    l: Address;
    m: Bool?;
    n: String?;
    o: Address?;
    p: Int?;
}

contract Test {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a:1,b:2,c:3,d:4,e:5,f:6,g:true,h:false,i:"hi",j:"bye",k:emptyCell(),l:myAddress(),
            m:null,n:null,o:null,p:null,
        };
    }
}