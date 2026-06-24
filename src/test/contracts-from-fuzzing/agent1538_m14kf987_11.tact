struct DeeplyNested {
    a: Int;
}

struct Middle1 {
    n: DeeplyNested;
}

struct Middle2 {
    m: Middle1;
}

struct Middle3 {
    m2: Middle2;
}

contract TestContract {
    chain: Middle3;

    init() {
        self.chain = Middle3{ m2: Middle2{ m: Middle1{ n: DeeplyNested{ a: 99 }}}};
    }
}