struct Big {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: Bool; g: Bool; h: Bool; i: Bool; j: Bool;
    k: String; l: String; m: String; n: String; o: String;
    p: Int?; q: Int?; r: Int?; s: Int?; t: Int?;
    u: String?; v: String?; w: String?; x: String?; y: String?;
    z: Bool; z2: Bool; z3: Bool; z4: Bool; z5: Bool;
}

contract LargeStructTest {
    record: Big;

    init() {
        self.record = Big{
            a:1,b:2,c:3,d:4,e:5,
            f:true,g:false,h:true,i:false,j:true,
            k:"a",l:"b",m:"c",n:"d",o:"e",
            p:null,q:null,r:null,s:null,t:null,
            u:null,v:null,w:null,x:null,y:null,
            z:true,z2:false,z3:true,z4:false,z5:true
        };
    }
}