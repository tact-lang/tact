struct OneOpt {
    a: Int?;
}

struct DeepReuse {
    one: OneOpt;
    two: OneOpt;
    three: OneOpt;
}

contract OptionReuse {
    val: DeepReuse;
    init() {
        self.val = DeepReuse{
            one: OneOpt{a:null},
            two: OneOpt{a:null},
            three: OneOpt{a:null},
        };
    }
}