struct MultiNest {
    lev1: Lev1;
}

struct Lev1 {
    lev2: Lev2;
}

struct Lev2 {
    lev3: Lev3;
}

struct Lev3 {
    lev4: Lev4;
}

struct Lev4 {
    value: Int;
}

contract TestContract {
    data: MultiNest;

    init() {
        self.data = MultiNest{
            lev1: Lev1{
                lev2: Lev2{
                    lev3: Lev3{
                        lev4: Lev4{
                            value:123
                        }
                    }
                }
            }
        };
    }
}