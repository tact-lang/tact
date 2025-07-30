contract Test {
    // Persistent state variable, declared but not initialized (thus default-initialized to null)
    x: Int?;

    receive() {}

    // Getter function returning a nullable Int
    get fun getX(): Int? {
        return self.x;
    }
}
