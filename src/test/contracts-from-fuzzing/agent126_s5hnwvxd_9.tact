// Large chain of contract fields with deep optional nesting, forcing serialization depth
struct Deep {
    n1: N1?;
}

struct N1 {
    n2: N2?;
}

struct N2 {
    n3: N3?;
}

struct N3 {
    n4: N4?;
}

struct N4 {
    x: Int?;
}

contract TestContract {
    root: Deep;

    init() {
        self.root = Deep{
            n1: N1{
                n2: N2{
                    n3: N3{
                        n4: N4{
                            x: null
                        }
                    }
                }
            }
        };
    }
}