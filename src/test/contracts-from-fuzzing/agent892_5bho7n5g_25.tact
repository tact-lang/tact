struct Nest1 { a: Int; }
struct Nest2 { n1: Nest1; }
struct Nest3 { n2: Nest2; }
struct Nest4 { n3: Nest3; }
struct Nest5 { n4: Nest4; }

contract Deep5 {
    n5: Nest5;

    init() {
        self.n5 = Nest5{
            n4: Nest4{
                n3: Nest3{
                    n2: Nest2{
                        n1: Nest1{
                            a: 77
                        }
                    }
                }
            }
        };
    }
}