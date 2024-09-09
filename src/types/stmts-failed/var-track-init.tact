primitive Int;
primitive Bool;
trait BaseTrait {}

struct SA {
    Aa: Int;
    Ab: SB;
}

struct SB {
    Ba: Bool;
    Bb: Int;
    Bc: Int;
}

contract Test {

    f: SB = SB {Ba: false, Bb: 0, Bc: 2 + 2};
    g: SB;

    init(v: Int) {
        let a: SA = SA {Aa: 0, Ab: SB {Ba: true, Bb: 5, Bc: 0}};   
        a.Aa = v;                     // Since v is undetermined, field Aa is also undetermined.
        1 / a.Aa;                     // OK because a.Aa is undetermined.
        1 / a.Ab.Bb;                  // OK
        a.Ab = self.f;                // Overwrites all fields in a.Ab with the default struct in self.f.
        // 1 / a.Ab.Bb;               // Commented because it would cause a division by zero.
        a.Ab.Ba = false;
        a.Ab.Bb = 2;
        a.Ab.Bc = 10;
        self.g = a.Ab;
        1 / self.g.Bb;                // OK
        self.g.Bb = 0;
        1 / self.g.Bb;                // Division by zero.
    }
}
