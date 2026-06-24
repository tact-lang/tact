struct NestOpt1 { inner: Int?; }
struct NestOpt2 { n1: NestOpt1?; }
struct NestOpt3 { n2: NestOpt2?; }

contract Test {
    f: NestOpt3;

    init() {
        self.f = NestOpt3{
            n2: NestOpt2{
                n1: NestOpt1{
                    inner: null
                }
            }
        };
    }
}