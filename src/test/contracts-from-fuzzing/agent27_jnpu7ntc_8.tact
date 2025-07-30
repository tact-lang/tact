contract TestReplaceNull {
    receive() {
        // Test replace() with null to delete an entry
        let m: map<Int, Int> = emptyMap();
        m.set(2, 20);
        let repExisting: Bool = m.replace(2, null);
        dump(repExisting); // expecting dump(true)
        dump(m.exists(2)); // expecting dump(false)

        let repNonExisting: Bool = m.replace(3, null);
        dump(repNonExisting); // expecting dump(false)
    }
}
