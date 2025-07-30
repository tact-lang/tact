message MyMessage {
    value: Int;
}

contract BounceTest {
    bounced(msg: bounced<MyMessage>) {
        // Typed bounce receiver: valid as per documentation 
    }
}