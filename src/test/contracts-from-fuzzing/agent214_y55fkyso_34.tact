struct RecOpt1 { val: Int? }
struct RecOpt2 { next: RecOpt1? }
struct RecOpt3 { last: RecOpt2? }

contract ChainOpt {
    d: RecOpt3;

    init() {
        self.d = RecOpt3{
            last: RecOpt2{
                next: RecOpt1{
                    val: null
                }
            }
        };
    }
}
