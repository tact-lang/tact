// contract with very deeply nested optional structs
struct N4 { d: Int?; }
struct N3 { c: N4?; }
struct N2 { b: N3?; }
struct N1 { a: N2?; }

contract VeryDeepOpt {
    state: N1;

    init() {
        self.state = N1{
            a: N2{
                b: N3{
                    c: N4{ d: null }
                }
            }
        };
    }
}