contract MixedDefaultsAndOpts {
    a: Int = 0;
    b: Int? = null;
    c: Int? = 5;
    d: Bool = false;
    e: Bool? = null;
    f: Bool? = true;
    g: String = "x";
    h: String? = null;
    i: String? = "y";

    init() {
        self.a=1; self.b=2; self.c=3; self.d=true;
        self.e=false; self.f=false; self.g="z";
        self.h="foo"; self.i="bar";
    }
}