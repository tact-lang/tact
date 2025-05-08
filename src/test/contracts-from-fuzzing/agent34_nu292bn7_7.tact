contract Test {
    // Testing default-initialized primitive state variable
    v: Int = 0;

    // required receive function
    receive() {}

    // Getter that returns a default-initialized primitive state variable
    get fun getV(): Int {
         return self.v;
    }
}
