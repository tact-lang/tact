struct BigStruct {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Address?;
    f: Int;
    g: Bool;
    h: Int;
    i: Bool;
    j: Address?;
}

contract BigHolder {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a:1, b:true, c:2, d:false, e:null, f:3, g:true, h:4, i:false, j:null
        };
    }

    receive() {}
}