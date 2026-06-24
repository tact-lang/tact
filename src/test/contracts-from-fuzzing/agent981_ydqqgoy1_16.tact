struct Sub1 { x: Int; }
struct Sub2 { y: Int; }

struct Combine {
    f1: Sub1;
    f2: Sub2;
}

contract TwoStructs {
    data: Combine;
    init(){
        self.data = Combine{
            f1: Sub1{ x: 11 },
            f2: Sub2{ y: 22 },
        };
    }
}