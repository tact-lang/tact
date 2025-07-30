struct S2 {
    a: Int;
    b: Bool;
}

contract DefaultVals {
    f1: Int = 0;
    f2: Bool = false;
    f3: String = "abc";
    f4: S2 = S2{a:5,b:true};

    init() {}
}