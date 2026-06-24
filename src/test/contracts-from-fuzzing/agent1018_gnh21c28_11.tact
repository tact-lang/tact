struct BigNest1 {
    val1: Int;
    val2: Bool;
}

struct BigNest2 {
    nest1: BigNest1;
    txt: String;
}

struct BigNest3 {
    nest2: BigNest2;
    opt: Int?;
}

contract BigNestContract {
    nested: BigNest3;

    init() {
        self.nested = BigNest3{
            nest2: BigNest2{
                nest1: BigNest1{
                    val1: 5,
                    val2: true
                },
                txt: "text"
            },
            opt: null
        };
    }
}