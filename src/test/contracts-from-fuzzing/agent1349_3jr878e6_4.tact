struct BigStruct {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: Int;
    f: Bool;
    g: Bool;
    h: Int;
    i: Bool;
    j: Int;
}

contract BigFields {
    data: BigStruct = BigStruct{
        a:1, b:2, c:true, d:false, e:3, f:true, g:false, h:4, i:true, j:5
    };

    receive() {
        self.data = self.data;
    }
}