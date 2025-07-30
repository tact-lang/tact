struct InnerOptionals {
    i: Int?;
    s: String?;
}

struct Combination {
    flag: Bool = false;
    inner: InnerOptionals;
    count: Int = 100;
}

contract TestContract {
    comb: Combination = Combination{
        flag: false,
        inner: InnerOptionals{},
        count: 100
    };

    init() {
        self.comb = Combination{
            flag: false,
            inner: InnerOptionals{},
            count: 100
        };
    }
}