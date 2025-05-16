struct BigNest1 {
    i: Int;
}

struct BigNest2 {
    n: BigNest1;
}

struct BigNest3 {
    n2: BigNest2;
}

struct BigNest4 {
    n3: BigNest3;
}

struct BigNest5 {
    n4: BigNest4;
}

contract DeepNesting5 {
    data: BigNest5;

    init() {
        self.data = BigNest5{
            n4: BigNest4{
                n3: BigNest3{
                    n2: BigNest2{
                        n: BigNest1{
                            i: 777
                        }
                    }
                }
            }
        };
    }
}
