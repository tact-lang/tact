message MyMessage {
    data: Int;
}

contract TestTryCatchBounced {
    bounced(msg: bounced<MyMessage>) {
        try {
            require(false, "Intentional failure");
        } catch (e) {
            // Catching the error: record a comment or perform recovery
            // Optionally do nothing
        }
    }
}
