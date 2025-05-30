message MsgA {
    field: Int;
}

message MsgB {
    field: Int;
}

contract BounceMultiple {
    bounced(msg: bounced<MsgA>) {
        // Valid bounce receiver for MsgA
    }

    bounced(msg: bounced<MsgB>) {
        // Valid bounce receiver for MsgB
    }

    bounced(raw: Slice) {
        // Fallback bounce receiver for raw slices
    }
}
