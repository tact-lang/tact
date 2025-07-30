struct InnerA {
    alpha: Int?;
}

struct InnerB {
    beta: String?;
}

struct Combined {
    ia: InnerA;
    ib: InnerB;
}

contract TestContract {
    state: Combined;
    init() {
        self.state = Combined{
            ia: InnerA{ alpha: null },
            ib: InnerB{ beta: null }
        };
    }
}