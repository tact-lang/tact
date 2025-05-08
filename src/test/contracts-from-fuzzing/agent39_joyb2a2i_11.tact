message LargeBounce {
    value: Int;
    extra: Cell;
}

contract BounceLargeTest {
    // This bounce receiver is expected to fail compilation if the bounced message exceeds 224 usable data bits
    bounced(msg: bounced<LargeBounce>) {
        // Handler code
    }
}
