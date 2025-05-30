contract GetterTest {
    counter: Int = 0;

    // Getter that tries to modify state variable
    get fun modifyGetter(): Int {
         self.counter = self.counter + 1;
         return self.counter;
    }

    init() {
         self.counter = 0;
    }
}
