message EmptyMessage {}

contract BounceReceiver_Empty {
    bounced(msg: bounced<EmptyMessage>) {
        // No data to access
    }
}
