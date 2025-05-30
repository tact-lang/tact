struct SInner {
    flag: Bool?;
    count: Int;
}

struct SOuter {
    data: SInner?;
    text: String;
}

contract DeepOptionalContract {
    record: SOuter;
    
    init() {
        self.record = SOuter{
            data: SInner{flag: null, count: 0},
            text: "abc"
        };
    }
}