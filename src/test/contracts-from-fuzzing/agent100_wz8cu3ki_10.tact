struct Nest1 { a: Int }
struct Nest2 { n1: Nest1 }
struct Nest3 { n2: Nest2 }
struct Nest4 { n3: Nest3 }

contract Test11 {
    deep: Nest4;

    init() {
        self.deep = Nest4{
            n3: Nest3{
                n2: Nest2{
                    n1: Nest1{ a: 42 }
                }
            }
        };
    }
}