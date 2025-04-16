struct SA { x: Int; }
struct SB { y: Bool; }

contract ManyStructs {
    s1: SA;
    s2: SB;
    s3: SA;
    s4: SB;

    init() {
        self.s1 = SA{x:1};
        self.s2 = SB{y:true};
        self.s3 = SA{x:2};
        self.s4 = SB{y:false};
    }
}