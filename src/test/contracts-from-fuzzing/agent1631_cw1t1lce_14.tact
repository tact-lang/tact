struct OptionDeep1 { f1: Bool?; }
struct OptionDeep2 { s: OptionDeep1?; }
struct OptionDeep3 { s: OptionDeep2?; }
struct OptionDeep4 { s: OptionDeep3?; }

contract ChainOpt {
    chain: OptionDeep4;

    init() {
        self.chain = OptionDeep4{
            s: OptionDeep3{
                s: OptionDeep2{
                    s: OptionDeep1{ f1: null }
                }
            }
        };
    }
}