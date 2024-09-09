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

    f: SB = SB {Ba: false, Bb: 10, Bc: 2 + 2};

    fun foo(v: Int): Int {
        let a: SA = SA {Aa: 0, Ab: SB {Ba: true, Bb: 5, Bc: 0}};   
        a.Aa = v;                     // Since v is undetermined, field Aa is also undetermined.
        1 / a.Aa;                     // OK because a.Aa is undetermined.
        1 / a.Ab.Bb;                  // OK
        // 1 / a.Ab.Bc;               // Commented because it would cause a division by zero.
        a.Ab = self.f;                // All fields in a.Ab become undetermined.
                                      // Even though self.f has a default value, the analyzer cannot assume 
                                      // that self.f remained unchanged before calling foo, since other 
                                      // parts of the code could change self.f.
        1 / a.Ab.Bc;                  // This no longer causes a division by zero at compile time.
        1 / a.Ab.Bb;                  // OK as well
        self.f.Bb = 0;                // Determine only the Bb field of self.f. The rest of fields remain undetermined.
        a.Ab = self.f;                // Only field a.Ab.Bb is determined, the rest of fields in a.Ab is undetermined.
        1 / a.Ab.Bc;                  // OK.
        1 / a.Ab.Bb;                  // Division by zero.
        return 0;
    }
}