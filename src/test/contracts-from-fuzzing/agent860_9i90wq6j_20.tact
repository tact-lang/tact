struct BigNest3 {
    s: BigNest2;
}
struct BigNest2 {
    s: BigNest1;
}
struct BigNest1 {
    a: Int;
    b: String;
}

contract HugeDepth {
    deepField: BigNest3;

    init() {
        self.deepField = BigNest3{
            s: BigNest2{
                s: BigNest1{
                    a: 777,
                    b: "deep"
                }
            }
        };
    }
}