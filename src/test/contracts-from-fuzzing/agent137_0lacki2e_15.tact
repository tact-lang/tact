struct BigNest1 { n: BigNest2; }
struct BigNest2 { n: BigNest3; }
struct BigNest3 { n: BigNest4; }
struct BigNest4 { n: BigNest5; }
struct BigNest5 { n: BigNest6; }
struct BigNest6 { n: BigNest7; }
struct BigNest7 { n: BigNest8; }
struct BigNest8 { n: BigNest9; }
struct BigNest9 { x: Int; }

contract TestBigNest {
    s: BigNest1;
    init() {
        self.s = BigNest1{ n: BigNest2{ n: BigNest3{ n: BigNest4{ n: BigNest5{ n: BigNest6{ n: BigNest7{ n: BigNest8{ n: BigNest9{ x: 99 }}}}}}}}};
    }
}