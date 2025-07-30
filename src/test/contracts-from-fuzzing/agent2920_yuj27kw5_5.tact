struct ParamA { a: Int }
struct ParamB { b: Bool }

contract ManySeparate {
    fa: ParamA;
    fb: ParamB;

    init() {
        self.fa = ParamA{ a: 1 };
        self.fb = ParamB{ b: true };
    }
}