struct BigNested {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;
}

contract BigNestedContract {
    val: BigNested;

    init() {
        self.val = BigNested {
            a:1, b:true, c:null, d:null,
            e:5, f:false, g:null, h:null
        };
    }
}