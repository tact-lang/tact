struct Seq1 {
    next: Seq2;
}

struct Seq2 {
    next: Seq3;
}

struct Seq3 {
    next: Seq4;
}

struct Seq4 {
    next: Seq5;
}

struct Seq5 {
    val: Int;
}

contract TestContract {
    chain: Seq1;

    init() {
        self.chain = Seq1{
            next: Seq2{
                next: Seq3{
                    next: Seq4{
                        next: Seq5{
                            val: 101
                        }
                    }
                }
            }
        };
    }
}