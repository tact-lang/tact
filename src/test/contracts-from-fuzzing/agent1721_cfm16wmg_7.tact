struct ManyOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
    i: Int?;
    j: Int?;
}

contract OptionalsTest {
    val: ManyOptional;

    init() {
        self.val = ManyOptional{
            a:null,b:1,c:null,d:2,e:null,
            f:3,g:null,h:4,i:null,j:5
        };
    }
}