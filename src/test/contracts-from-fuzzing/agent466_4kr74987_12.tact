struct Mid {
    ai: Int;
    bi: String;
    ci: Bool;
}

struct Top {
    m1: Mid;
    m2: Mid;
    val: Int?;
}

contract StructsOnStructs {
    state: Top;

    init() {
        self.state = Top{
            m1: Mid{ai:1, bi:"a", ci:true},
            m2: Mid{ai:2, bi:"b", ci:false},
            val: null
        };
    }
}