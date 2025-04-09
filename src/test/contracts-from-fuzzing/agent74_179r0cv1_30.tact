struct Inner {
    user: Address?;
    flag: Bool;
}

struct Outer {
    payload: Inner;
    count: Int;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            payload: Inner{ user: null, flag: true },
            count: 777
        };
    }
}