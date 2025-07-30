contract GetterTest {
    x: Int;

    init() {
        self.x = 0;
    }
    
    // Getter function that “modifies” state variable
    // According to documentation, getters cannot modify state variables;
    // however, in reality, modifications occur at runtime and are not persistent.
    get fun modifyAndReturn(): Int {
        self.x = self.x + 1;
        return self.x;
    }

    // A normal function to read state
    fun getX(): Int {
        return self.x;
    }
}
