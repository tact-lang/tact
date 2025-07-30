contract TryTest2_v2 {
    // Persistent state variable a, default value assigned
    a: Int = 10;

    receive() {
        try {
            // Attempt to modify the state
            self.a = self.a + 5; // would change a from 10 to 15
            throw(777);
        } catch (err) {
            // The state modification should be rolled back; expected value is still 10
            dump(self.a);
        }
    }
}
