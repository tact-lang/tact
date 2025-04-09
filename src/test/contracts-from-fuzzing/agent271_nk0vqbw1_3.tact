struct Tiny {
    flag: Bool;
}

contract TestContract {
    f: Tiny;
    
    init() {
        self.f = Tiny{ flag: true };
    }
}