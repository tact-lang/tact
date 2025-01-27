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

    init(v: Int) {
        let a: SA = SA {Aa: 0, Ab: SB {Ba: true, Bb: 5, Bc: 0}};   
        1 / a.Ab.Bb;                  // OK
        // 1 / a.Aa;                  // Commented because it would cause a division by zero.
        // self.f.Bb / self.f.Bb;     // Commented because it would cause a division by zero.
        1 / (self.f.Bc - self.f.Bc);  // Division by zero             
    }
}