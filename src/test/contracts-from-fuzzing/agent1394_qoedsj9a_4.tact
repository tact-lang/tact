contract LongFieldList {
    a: Int = 1;
    b: Bool = false;
    c: Int = 2;
    d: Bool = true;
    e: Int = 3;
    f: Bool = false;
    g: Int = 4;
    h: Bool = true;
    i: Int = 5;
    j: Bool = false;
    k: Int = 6;
    l: Bool = true;
    m: Int = 7;
    n: Bool = false;
    o: Int = 8;
    p: Bool = true;
    q: Int = 9;
    r: Bool = false;
    s: Int = 10;
    t: Bool = true;
    
    init() {
        // override some to test assignment
        self.a = 42;
        self.t = false;
    }
}
