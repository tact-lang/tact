struct Seq1 {
    a: Int;
}

struct Seq2 {
    b: Seq1;
}

struct Seq3 {
    c: Seq2;
}

struct Seq4 {
    d: Seq3;
}

struct Seq5 {
    e: Seq4;
}

contract ChainNestedFields {
    s: Seq5;
    init() {
        self.s = Seq5{
            e: Seq4{
                d: Seq3{
                    c: Seq2{
                        b: Seq1{
                            a: 999
                        }
                    }
                }
            }
        };
    }
}