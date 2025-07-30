message TestMsg {
    data: Int;
}

contract BounceConflict {
    bounced(msg: bounced<TestMsg>) {
        // First bounced receiver
    }
    
    bounced(raw: Slice) {
        // Second bounced receiver
    }
}
