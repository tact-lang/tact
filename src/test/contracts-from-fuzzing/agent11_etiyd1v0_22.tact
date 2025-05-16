contract GetterStateTest {
    // State variable
    x: Int;

    init() {
        self.x = 100;
    }

    // Getter that modifies the state variable. According to documentation, getters should not modify state, but in runtime changes are not persisted.
    // This test verifies that the compiler accepts state modifications in a getter, even though they won't be saved.
    get fun modifyGetter() : Int {
        self.x = self.x + 1;
        return self.x;
    }

    // A regular getter that just returns the state variable
    get fun readGetter() : Int {
        return self.x;
    }
}
