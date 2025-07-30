contract TestMapExtensions {
    get fun test(): Int {
        // Create two empty maps
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();

        // Check that m1 is empty using .isEmpty() and equality with null
        if (!m1.isEmpty() || m1 != null) { return 1; }

        // Set a value
        m1.set(10, 100);
        m2.set(10, 100);

        // Test .exists() and .get()
        if (!m1.exists(10)) { return 2; }
        if (m1.get(10)!! != 100) { return 3; }

        // Test shallow equality using == and deep equality using .deepEquals()
        if (!(m1 == m2)) { return 4; } // shallow equality
        if (!m1.deepEquals(m2)) { return 5; }

        // Test deletion via setting value to null
        m1.set(10, null);
        if (m1.exists(10)) { return 6; }

        return 42;
    }
}
