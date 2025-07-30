contract TestDefaultStateGetterFixed {
    // Persistent state variable v, explicitly initialized with default value 0
    v: Int = 0;

    receive() {}

    // Getter function that returns the value of state variable v
    get fun getV(): Int {
        return self.v;
    }
}
