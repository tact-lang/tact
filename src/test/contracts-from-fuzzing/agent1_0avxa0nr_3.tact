message MyBounce {
    value: Int;
}

contract BounceTest3 {
    // Typed bounce receiver for MyBounce
    bounced(msg: bounced<MyBounce>) {
        // Process bounced message of type MyBounce
    }

    // Fallback bounce receiver for raw slices
    bounced(raw: Slice) {
        // Process remaining bounced messages not matching typed receiver
    }
}
