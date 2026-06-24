struct Empty1 { x: Int; }
struct Empty2 { y: Int; }

contract Mix {
    f1: Empty1 = Empty1{x:0};
    f2: Empty2 = Empty2{y:0};
    
    init() {
        self.f1 = Empty1{x:42};
        self.f2 = Empty2{y:13};
    }
}