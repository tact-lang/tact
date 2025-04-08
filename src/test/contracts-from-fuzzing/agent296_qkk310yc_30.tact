struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract ArrayOpt {
    data1: S?;
    data2: S?;
    data3: S?;

    init() {
        self.data1 = null;
        self.data2 = S{a:1, b:true, c:"x"};
        self.data3 = null;
    }
}
