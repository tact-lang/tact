contract MixDefaultsOpts {
    a:Int=5;
    b:Int?;
    c:Int=10;
    d:Int?;

    init() {
        self.b=null;
        self.d=20;
    }
}
