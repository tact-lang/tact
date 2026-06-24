struct Middle1 {
    a: Int;
}

struct Middle2 {
    b: Bool?;
}

struct Middle3 {
    c: String;
}

struct Aggregator {
    m1: Middle1;
    m2: Middle2;
    m3: Middle3;
}

contract CombinedStructs {
    aggr: Aggregator;

    init() {
        self.aggr = Aggregator{
            m1: Middle1{a:1},
            m2: Middle2{b: null},
            m3: Middle3{c: "str"},
        };
    }
}