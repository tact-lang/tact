struct Simple {
    a: Int;
    b: Bool;
}

contract ManyFields {
    a0: Int = 0;
    a1: Int = 1;
    a2: Int = 2;
    a3: Int = 3;
    a4: Int = 4;
    a5: Int = 5;
    a6: Int = 6;
    a7: Int = 7;
    a8: Int = 8;
    a9: Int = 9;
    b0: Bool = false;
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool = true;
    b4: Bool = false;
    b5: Bool = true;
    b6: Bool = false;
    b7: Bool = true;
    b8: Bool = false;
    b9: Bool = true;
    s0: Simple = Simple{a:1,b:true};
    s1: Simple = Simple{a:2,b:false};
    s2: Simple = Simple{a:3,b:true};
    s3: Simple = Simple{a:4,b:false};

    init() {}
}
