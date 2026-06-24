struct S {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
    g: Int; 
}

contract ManyNullables {
    val: S;

    init() {
        self.val = S{
            a:null, b:null, c:null, d:null, e:null, f:null, g:0
        };
    }
}