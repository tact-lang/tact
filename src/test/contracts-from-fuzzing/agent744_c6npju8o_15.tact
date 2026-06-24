struct Sequence1 { a: Int }
struct Sequence2 { b: Sequence1 }
struct Sequence3 { c: Sequence2 }
struct Sequence4 { d: Sequence3 }
struct Sequence5 { e: Sequence4 }

contract ChainLike {
    link: Sequence5;

    init() {
        self.link = Sequence5{
            e: Sequence4{
                d: Sequence3{
                    c: Sequence2{
                        b: Sequence1{
                            a: 13
                        }
                    }
                }
            }
        };
    }
}