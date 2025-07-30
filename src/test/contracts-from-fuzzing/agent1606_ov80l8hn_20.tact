struct BigNest1 {
    f1: Int;
}

struct BigNest2 {
    f2: BigNest1;
}

struct BigNest3 {
    f3: BigNest2;
}

struct BigNest4 {
    f4: BigNest3;
}

struct BigNest5 {
    f5: BigNest4;
}

contract BigNestedContract {
    val: BigNest5;

    init() {
        self.val = BigNest5{
            f5: BigNest4{
                f4: BigNest3{
                    f3: BigNest2{
                        f2: BigNest1{
                            f1: 123
                        }
                    }
                }
            }
        };
    }
}
