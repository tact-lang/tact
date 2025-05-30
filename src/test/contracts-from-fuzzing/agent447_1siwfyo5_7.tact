struct S {
    x: Int;
    y: Bool;
    z: String;
}

contract NoInit {
    f1: Int = 5;
    f2: Bool = true;
    f3: String = "abc";
    f4: S = S{ x:1,y:false,z:"" };
}