contract OptionTest {
    fun run() {
        // Declare an optional integer, initially null
        let opt: Int? = null;
        // Later assign a non-null value
        let newVal: Int = 123;
        // Since optionals can be assigned non-null values
        let opt2: Int? = newVal;
        // Check before using non-null assertion
        if (opt2 != null) {
            dump(opt2!!);
        }
    }
}
