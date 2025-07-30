struct Bottom {
    x: Int as int32;
    y: Int as uint128;
}

struct Mid {
    data: Bottom?;
    val: Int as int64;
}

contract TestContract {
    s: Mid;
    
    init() {
        self.s = Mid{
            data: null,
            val: 0
        };
    }
}