struct MultiBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
}

contract ManyBools {
    data: MultiBool;

    init() {
        self.data = MultiBool { a:true, b:false, c:true, d:false, e:true, f:false };
    }
}