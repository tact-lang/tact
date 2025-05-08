// intentionally create large number of nested structs to test compiler
struct N1 { a: Int }
struct N2 { prev: N1 }
struct N3 { prev: N2 }
struct N4 { prev: N3 }
struct N5 { prev: N4 }
struct N6 { prev: N5 }
struct N7 { prev: N6 }
struct N8 { prev: N7 }
struct N9 { prev: N8 }
struct N10 { prev: N9 }

contract LayerCake {
    data: N10;

    init() {
        self.data = N10{
            prev: N9{
                prev: N8{
                    prev: N7{
                        prev: N6{
                            prev: N5{
                                prev: N4{
                                    prev: N3{
                                        prev: N2{
                                            prev: N1{
                                                a:42
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}
