message MyMsg {
    data: Int;
}

contract DoubleBounce {
    // Typed bounce receiver
    bounced(msg: bounced<MyMsg>) {
    }

    // Fallback bounce receiver using Slice
    bounced(raw: Slice) {
    }

    receive() {
    }
}
