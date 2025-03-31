message MyMessage {}

contract BounceTest {
    // Standard bounce receiver with a typed parameter
    bounced(msg: bounced<MyMessage>) {
        // Handle bounced message
    }
}