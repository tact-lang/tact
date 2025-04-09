// long mixed optional/non-optional struct
struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Bool;
    i: Int?;
    j: String?;
}

contract TestContract {
    val: Combo;

    init() {
        self.val = Combo{
            a:1,b:null,c:true,d:null,e:"E",f:null,
            g:7,h:false,i:42,j:"end"
        };
    }
}