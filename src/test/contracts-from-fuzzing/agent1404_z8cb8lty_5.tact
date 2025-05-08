struct BigStruct {
    a: Int; b: Int; c: Int; d: Int; e: Int; f: Int; g: Int; h: Int; i: Int; j: Int;
    k: String; l: String; m: String; n: String; o: String;
    p: Bool; q: Bool; r: Bool; s: Bool; t: Bool;
    u: Int?; v: Int?; w: Int?; x: Int?; y: Int?;
}

contract TestBigStruct {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,
            k:"k",l:"l",m:"m",n:"n",o:"o",
            p:true,q:false,r:true,s:false,t:true,
            u:11,v:12,w:13,x:null,y:14,
        };
    }
}
