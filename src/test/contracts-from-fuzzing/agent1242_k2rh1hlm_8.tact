struct BigOptionals {
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
    k: Int?;
    l: Int?;
}

contract TestContract {
    val: BigOptionals;

    init() {
        self.val = BigOptionals{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null, h:null, i:null, j:null, k:null, l:null,
        };
    }
}