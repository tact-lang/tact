struct NestedPoint {
    x: Int as int64;
    y: Int as int64;
}

struct Envelope {
    inner: NestedPoint;
    optionalInner: NestedPoint?;
    flag: Bool;
}

contract DeepStructStorage {
    data: Envelope;

    init() {
        self.data = Envelope{
            inner: NestedPoint{ x: 1, y: -1 },
            optionalInner: null,
            flag: true,
        };
    }
}