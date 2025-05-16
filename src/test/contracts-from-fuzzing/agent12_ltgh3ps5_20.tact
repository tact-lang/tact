message MyBounced {
    code: Int;
}

contract BouncedTest {
    bounced(_: bounced<MyBounced>) {
        // Received bounced MyBounced message with discarded parameter
    }
}
