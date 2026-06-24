contract BranchTest {
    const ENABLE_FEATURE: Bool = true;

    receive() {
        if (self.ENABLE_FEATURE) {
            let a: Int = 1;
        } else {
            let a: Int = 0;
        }
    }
}
