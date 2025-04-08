// test many optional fields inside a contract directly
contract TestContract {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Bool?;
    f: Bool?;

    init() {
        self.a=null; self.b=5; self.c=null;
        self.d=10; self.e=false; self.f=null;
    }
}