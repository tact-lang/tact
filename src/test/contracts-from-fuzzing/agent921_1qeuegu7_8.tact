struct HasBool {
    flag: Bool;
}

struct HasOptBool {
    optFlag: Bool?;
}

struct Comb {
    a: HasBool;
    b: HasOptBool;
}

contract NestedOptional {
    store: Comb;
    init() {
        self.store = Comb{
            a: HasBool{ flag: true },
            b: HasOptBool{ optFlag: null }
        };
    }
}