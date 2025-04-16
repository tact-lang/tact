struct OptionalStress {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Cell?;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Slice?;
    j: Cell?;
}

contract StressOpt {
    val: OptionalStress;

    init() {
        self.val = OptionalStress{
            a:null,b:null,c:null,d:null,e:null,
            f:null,g:null,h:null,i:null,j:null
        };
    }
}