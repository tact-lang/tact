struct Chain3 { link: Chain4; }
struct Chain4 { link: Chain5; }
struct Chain5 { value: Int; }

struct Chain2 { link: Chain3; }
struct Chain1 { link: Chain2; }

contract ChainContract {
    root: Chain1;

    init() {
        self.root = Chain1{
            link: Chain2{
                link: Chain3{
                    link: Chain4{
                        link: Chain5{ value: 99 }
                    }
                }
            }
        };
    }
}