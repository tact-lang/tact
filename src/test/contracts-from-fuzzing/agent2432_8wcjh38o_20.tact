struct SA { f1: Int; }
struct SB { f2: Int; sa: SA; }
struct SC { f3: Int; sb: SB; }
struct SD { f4: Int; sc: SC; }

contract Test {
    sOpt: SD?;
    init() {
        self.sOpt = null;
    }
}