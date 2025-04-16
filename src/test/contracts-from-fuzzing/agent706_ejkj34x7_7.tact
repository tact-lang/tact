struct Wide {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: String;
    f: Bool;
    g: Int;
    h: String;
    i: Bool;
    j: Int;
    k: String;
}

contract WideStructTest {
    data: Wide;

    init() {
        self.data = Wide{
            a:1, b:2, c:3, d:true, e:"x",
            f:false, g:4, h:"y", i:true, j:5, k:"z"
        };
    }
}