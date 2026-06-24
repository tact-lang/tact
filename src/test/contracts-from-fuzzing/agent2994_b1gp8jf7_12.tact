struct MultiNest1 {
    f: MultiNest2;
}

struct MultiNest2 {
    f: MultiNest3;
}

struct MultiNest3 {
    f: MultiNest4;
}

struct MultiNest4 {
    f: MultiNest5;
}

struct MultiNest5 {
    val: Int;
}

contract MultiDeep {
    root: MultiNest1;
    init() {
        self.root = MultiNest1{
            f: MultiNest2{
                f: MultiNest3{
                    f: MultiNest4{
                        f: MultiNest5{
                            val: 123
                        }
                    }
                }
            }
        };
    }
}