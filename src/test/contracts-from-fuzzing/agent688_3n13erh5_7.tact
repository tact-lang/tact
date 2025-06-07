contract TestContract {
    s: String = "x";
    t: String = "y";
    u: String; 
    v: String;

    init() {
        self.u = "hello";
        self.v = "world";
    }
}