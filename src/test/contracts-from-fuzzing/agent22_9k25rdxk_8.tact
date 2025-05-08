message BounceMsg {}

contract TestBounceStateChange2 {
    count: Int;

    init() {
        self.count = 0;
    }

    bounced(msg: bounced<BounceMsg>) {
        // Increase internal count; note that modifications in bounced receiver may not be persisted.
        self.count += 1;
    }

    receive("start") {}
}
