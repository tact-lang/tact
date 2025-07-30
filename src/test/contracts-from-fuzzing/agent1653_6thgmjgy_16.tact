// Optional message struct inside an optional struct inside contract field
message(42) Msg {} 

struct SInner {
    m: Msg?;
}

struct SOuter {
    inner: SInner?;
}

contract TestContract {
    data: SOuter;

    init() {
        self.data = SOuter{
            inner: null
        };
    }
}