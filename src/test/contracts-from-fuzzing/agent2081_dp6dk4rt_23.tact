struct T1 { x: Int; }
struct T2 { t1: T1; }
struct T3 { t2: T2; }
struct T4 { t3: T3; }

contract DeepNest4 {
    vv: T4;
    init() {
        self.vv = T4{t3: T3{t2: T2{t1: T1{x:42}}}};
    }
}