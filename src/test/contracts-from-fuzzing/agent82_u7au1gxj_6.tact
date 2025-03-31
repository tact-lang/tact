contract OptionalTest {
    // Optional state variable, default value is null
    x: Int?;

    receive() {}

    get fun getX(): Int? {
        // This getter returns the current value of x (which may be null)
        return self.x;
    }
}
