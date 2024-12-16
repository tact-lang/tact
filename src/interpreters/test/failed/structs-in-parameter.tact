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

struct SC {
    Ca: SA;
}

contract Test {

    f: SC = SC {Ca: SA {Aa: 5, Ab: SB {Ba: false, Bb: 6, Bc: 10}}};

    fun foo(v: SC): Int {   
        v.Ca.Ab.Bc = 0;            // Every other field in v is undetermined (including nested fields).
        let a = v;                 // The only determined field in a is a.Ca.Ab.Bc
        1 / a.Ca.Ab.Bb;            // OK, since value of a.Ca.Ab.Bb is unknown.
        self.f = a;                // The only determined field in self.f is self.f.Ca.Ab.Bc
        let b = self;              // The only determined field in b is b.f.Ca.Ab.Bc
        return 1 / b.f.Ca.Ab.Bc;   // Division by zero.
    }
}
