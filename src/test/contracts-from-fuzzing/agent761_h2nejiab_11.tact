struct StrctA { u: Int; }
struct StrctB { s: StrctA; }
struct StrctC { b: StrctB; }

contract DeepChain {
    payload: StrctC;

    init() {
        self.payload = StrctC{ b: StrctB{ s: StrctA{u:7} } };
    }
}
