struct Deep {
    z: Int?;
}

struct Middle {
    d: Deep?;
    flag: Bool?;
}

contract TestContract {
    persist: Middle;

    init() {
        self.persist = Middle{
            d: null,
            flag: null
        };
    }
}