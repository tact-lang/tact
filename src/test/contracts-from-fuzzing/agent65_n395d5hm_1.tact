contract Test {
    // state variable with initial value
    v: Int = 42;

    // required receive function
    receive() {}

    // getter returning a primitive value
    get fun getInt(): Int {
        return self.v;
    }
}
