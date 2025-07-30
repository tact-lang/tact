struct Inner {
    x: Int?;
    y: Bool?;
}

struct ContainsOpt {
    val: Int;
    maybeInner: Inner?;
}

contract TestContract {
    co: ContainsOpt;

    init() {
        self.co = ContainsOpt{
            val: 5,
            maybeInner: Inner{ x: null, y: true }
        };
    }
}