contract MapExistsTest {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set key 5 to value 55 and test existence
        self.m.set(5, 55);
        let existsKey5: Bool = self.m.exists(5);
        let existsKey10: Bool = self.m.exists(10);
    }
}
