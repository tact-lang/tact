struct Deep {
    x: Int;
}

struct Middle {
    d: Deep?;
    flag: Bool;
}

contract TestContract {
    persist: Middle;

    init() {
        self.persist = Middle{
            d: Deep{ x: 77 },
            flag: false
        };
    }
}