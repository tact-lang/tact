contract Test {
    // A simple state variable
    x: Int = 42;

    // Minimal receive function
    receive() {}

    // Getter returning a primitive Int
    get fun getX(): Int {
        return self.x;
    }
}