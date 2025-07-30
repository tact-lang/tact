struct Tuple {
    first: Int;
    second: Int;
    third: Int;
}

struct WithManyTuples {
    t1: Tuple;
    t2: Tuple;
    t3: Tuple;
}

contract MultipleStructsNested {
    data: WithManyTuples;

    init() {
        self.data = WithManyTuples{
            t1: Tuple{first:1,second:2,third:3},
            t2: Tuple{first:4,second:5,third:6},
            t3: Tuple{first:7,second:8,third:9}
        };
    }
}