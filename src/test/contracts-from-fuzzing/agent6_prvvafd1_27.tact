contract NestedTryTest {
    counter: Int = 0;
    receive() {
        try {
            try {
                self.counter = self.counter + 3; // counter becomes 3
                throw(111);
            } catch (code) {
                if (code == 111) {
                    self.counter = self.counter + 2; // counter becomes 5
                    throw(222);
                }
            }
        } catch (code) {
            if (code == 222) {
                self.counter = self.counter + 5; // counter becomes 10
            }
        }
        require(self.counter == 10, "Nested try-catch error: expected counter to be 10");
        cashback(sender());
    }
}
