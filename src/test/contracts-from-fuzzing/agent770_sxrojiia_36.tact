struct Deep {
    field: Deeper?;
}

struct Deeper {
    num: Int;
}

struct TopLevel {
    deep: Deep?;
}

contract TestContract {
    v: TopLevel;

    init() {
        self.v = TopLevel{
            deep: null
        };
    }
}