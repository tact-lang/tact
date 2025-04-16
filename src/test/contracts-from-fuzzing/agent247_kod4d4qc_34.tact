struct CycleA {
    next: CycleB?;
}

struct CycleB {
    next: CycleC?;
}

struct CycleC {
    value: Int;
}

contract CycleTest {
    data: CycleA;
    init() {
        self.data = CycleA{
            next: CycleB{
                next: CycleC{
                    value: 123
                }
            }
        };
    }
}