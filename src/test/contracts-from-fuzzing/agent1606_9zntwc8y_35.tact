contract PrimitiveMix {
    a: Int as uint8;
    b: Int as int16;
    c: Bool;
    d: String;
    e: Int?;
    f: Bool?;
    g: String?;

    init() {
        self.a=1; self.b=-2; self.c=true; self.d="x";
        self.e=null; self.f=null; self.g=null;
    }

    receive() {
        let A=self.a; let B=self.b; let C=self.c; let D=self.d;
        let E=self.e; let F=self.f; let G=self.g;
    }
}