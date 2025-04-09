struct SA { v: Int }
struct SB { v: Int }
struct SC { v: Int }
struct SD { v: Int }

contract MultiStructs {
    a: SA;
    b: SB;
    c: SC;
    d: SD;

    init() {
        self.a = SA{v:1};
        self.b = SB{v:2};
        self.c = SC{v:3};
        self.d = SD{v:4};
    }
}