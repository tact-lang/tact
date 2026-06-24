struct Opt1 { v: Int?; }
struct Opt2 { o: Opt1?; }
struct Opt3 { p: Opt2?; }

contract OptionalChain {
    chain: Opt3;

    init() {
        self.chain = Opt3{
            p: Opt2{
                o: Opt1{
                    v: null
                }
            }
        };
    }
}