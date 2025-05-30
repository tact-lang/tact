struct Mini {
    n: Int;
}

struct OuterOpt {
    m: Mini?;
    t: String;
}

contract NullMini {
    data: OuterOpt;
    
    init() {
        self.data = OuterOpt{
            m: null,
            t: "hi"
        };
    }
}