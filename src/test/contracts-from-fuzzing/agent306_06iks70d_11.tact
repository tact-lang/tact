struct OptNested {
    n1: Int?;
    n2: Int?;
}

contract ManyOptionals {
    opt: OptNested;

    init() {
        self.opt = OptNested{ n1: null, n2: null };
    }
}
