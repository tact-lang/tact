struct Breaker {
    a: Int?;
    b: Bool;
}

contract OverrideTest {
    s: Breaker;

    init() {
        self.s = Breaker{ a:null, b:true };
    }
}