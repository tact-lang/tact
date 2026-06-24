contract TestDefault {
    // State variable with default value
    v: Int = 10;

    // Minimal receiver to ensure compilation
    receive() {}

    // Getter returning the default-initialized state variable
    get fun getDefault(): Int {
        return self.v;
    }
}
