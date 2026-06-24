contract OptionalsValidTest() {
    // Testing valid usage of optional types
    fun test() {
        // Declare an optional integer, initially null
        let maybe: Int? = null;
        // Assign a non-null value
        let maybe2: Int? = 456;
        // Check if not null then use non-null assertion
        if (maybe2 != null) {
            dump(maybe2!!); // should dump 456
        }
    }

    // Required empty receiver function
    receive() {}
}
