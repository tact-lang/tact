contract Example {
    const ENABLE_TIMELOCK: Bool = true;

    receive() {
        if (self.ENABLE_TIMELOCK) {
            // constant used in runtime condition
        }
    }
}
