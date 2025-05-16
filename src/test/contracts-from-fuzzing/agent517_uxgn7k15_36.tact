struct Messy {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
}

contract MessyStructTest {
    val: Messy;

    init() {
        self.val = Messy{
            a:1,b:true,c:"hi",d:null,e:false,f:null,g:7,h:true,i:"bye"
        };
    }
}