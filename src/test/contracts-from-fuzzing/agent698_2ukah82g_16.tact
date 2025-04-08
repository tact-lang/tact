struct DeepStack {
    a: Int;
    b: Bool?;
    c: Int?;
    d: Int;
    e: Bool;
    f: Int?;
    g: Bool?;
    h: Int;
    i: Bool;
    j: Int?;
}

contract TestContract {
    ds: DeepStack;

    init() {
        self.ds = DeepStack{
            a:1, b:null, c:null, d:4, e:true,
            f:null, g:false, h:8, i:true, j:10,
        };
    }
}