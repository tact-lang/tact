struct Sub {
    f1: Int?;
    f2: Bool?;
}

contract TestContract {
    s: Sub;

    init() {
        self.s = Sub{ f1: null, f2: true };
    }
}