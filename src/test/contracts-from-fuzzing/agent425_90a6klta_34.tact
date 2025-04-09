// Optionals and nested optionals combined in large struct
struct Combo {
    a: Int?;
    b: Bool;
    c: Int;
    d: Bool?;
    e: Int?;
    f: Bool;
    g: Int;
    h: Bool?;
    i: Int?;
    j: Bool;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            a:null,b:true,c:1,d:null,e:2,f:false,g:3,h:true,i:null,j:false
        };
    }
}