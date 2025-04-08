struct LargeStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;
    i: Int;
    j: Bool;
    k: Int?;
    l: Bool?;
}

contract TestContract {
    s: LargeStruct;
    
    init() {
        self.s = LargeStruct{
            a: 1, b: false, c: null, d: null,
            e: 2, f: true,  g: 3,    h: false,
            i: 4, j: false, k: 5,    l: true
        };
    }
}