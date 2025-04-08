contract MixedDefaultsOptionals {
    a: Int?=null;
    b: Bool=true;
    c: Int=5;
    d: Bool?=null;

    init() {
        self.a=null;
        self.b=false;
        self.c=10;
        self.d=true;
    }
}