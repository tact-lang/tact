contract Test1 {
    // state variable just for demonstration
    state: Int = 10;

    // minimal receiver function to ensure full contract compilation
    receive () {}

    // Getter function returning a primitive Int value
    get fun getPrimitive(): Int {
        return 123;
    }
}
