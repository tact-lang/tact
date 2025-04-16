contract StateRollbackTest {
    // Test to check that side-effect assignments in a try block are rolled back on exception
    v: Int = 0;

    receive() {
        try {
            self.v = 5;
            throw(101);
        } catch (err) {
            // If rollback works, self.v should remain 0
            dump(self.v);
        }
    }
}
