// contract with long chain of nested structs with optionals at every level
struct N1 { n2: N2?; }
struct N2 { n3: N3?; }
struct N3 { n4: N4?; }
struct N4 { n5: N5?; }
struct N5 { val: Int; }

contract LongChainOptionals {
    nested: N1;

    init() {
        self.nested = N1{
            n2: N2{
                n3: N3{
                    n4: N4{
                        n5: N5{ val: 123 },
                    },
                },
            },
        };
    }
}