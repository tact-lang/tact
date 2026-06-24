struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract ManyOptionals {
    x: S?;
    y: S?;
    z: S?;
    q: S?;

    init() {
        self.x = null;
        self.y = S{ a:1, b:true, c:"one" };
        self.z = null;
        self.q = S{ a:2, b:false, c:"two" };
    }
}