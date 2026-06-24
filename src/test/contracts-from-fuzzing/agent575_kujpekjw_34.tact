message(42) EM {}

struct Holder {
    m: EM?;
    count: Int;
}

contract PartialWithOptMsg {
    data: Holder;

    init() {
        self.data = Holder{ count: 5 };
    }
}