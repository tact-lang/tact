struct SOne {
    a: Int;
    b: Bool;
}

struct STwo {
    one: SOne;
    x: Int;
}

contract TestContract {
    val: STwo;
    
    init() {
        self.val = STwo{
            one: SOne{ a: 5, b: true },
            x: 99
        };
    }
}