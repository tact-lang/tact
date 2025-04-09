struct BigFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
    i: String;
    j: String;
}

contract TestContract {
    big: BigFields;
    
    init() {
        self.big = BigFields{
            a:1, b:2, c:3, d:4, e:true, f:false, g:true, h:false,
            i:"hi", j:"bye"
        };
    }
}