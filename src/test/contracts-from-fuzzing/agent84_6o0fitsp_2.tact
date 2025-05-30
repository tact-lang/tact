/// Test Optional Valid Usage
contract TestOptionalValid {
    fun test() {
        // Declare an optional Int, initially null
        let opt: Int? = null;
        // Assign a proper integer value
        opt = 100;
        // Using non-null assertion to extract value
        dump(opt!!);
    }
    receive() {}
}
