struct Inner {
    amount: Int as coins;
    timestamp: Int as int64;
    nonce: Int as uint128;
}

struct Outer {
    payload: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            payload: Inner{
                amount: 1000,
                timestamp: 123456789,
                nonce: 42
            }
        };
    }
}