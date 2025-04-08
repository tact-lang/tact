struct Struct1 { x: Int }
struct Struct2 { y: Int }
struct Struct3 { z: Int }

struct Aggregate {
    s1: Struct1;
    s2: Struct2;
    s3: Struct3;
}

contract AggregateFields {
    agg: Aggregate;

    init() {
        self.agg = Aggregate{
            s1: Struct1{x: 1},
            s2: Struct2{y: 2},
            s3: Struct3{z: 3}
        };
    }
}