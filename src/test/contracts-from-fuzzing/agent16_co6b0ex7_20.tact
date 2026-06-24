struct OptionalDeep {
    lvl1: Inner1?;
}

struct Inner1 {
    lvl2: Inner2?;
}

struct Inner2 {
    lvl3: Inner3?;
}

struct Inner3 {
    val: Int?;
}

contract OptionDeepChain {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{lvl1:null};
    }
}