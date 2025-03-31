contract GetterTest {
    state: Int;

    init() {
        self.state = 0;
    }

    // Getter function that mutates state (even though the documentation states getters cannot modify state)
    get fun inc() : Int {
         self.state = self.state + 1;
         return self.state;
    }
}
