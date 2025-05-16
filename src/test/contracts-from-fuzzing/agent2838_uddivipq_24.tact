struct Struct1 { a: Int; }
struct Struct2 { a: Struct1; }
struct Struct3 { a: Struct2; }
struct Struct4 { a: Struct3; }
struct Struct5 { a: Struct4; }
struct Struct6 { a: Struct5; }

contract VeryDeepChain {
    s: Struct6;

    init() {
        self.s = Struct6{
            a: Struct5{
                a: Struct4{
                    a: Struct3{
                        a: Struct2{
                            a: Struct1{
                                a: 42
                            }
                        }
                    }
                }
            }
        };
    }
}