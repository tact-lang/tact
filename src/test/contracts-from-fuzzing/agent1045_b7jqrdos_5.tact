struct BigNested {
    inner1: Int?;
    inner2: Bool?;
    inner3: Address?;
}

contract TestContract {
    field: BigNested;

    init() {
        self.field = BigNested{ inner1: null, inner2: false, inner3: null };
    }

    receive() {
        self.field = BigNested{ inner1: 100, inner2: true, inner3: null };
    }
}