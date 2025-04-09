contract TestDeletion {
    get fun test(): Int {
        let m: map<Int, Int> = emptyMap();
        m.set(10, 100);
        let deletionSuccess: Bool = m.del(10);
        // After deletion, m.get(10) should be null
        if (m.get(10) != null) {
            return 0; // error case
        }
        return deletionSuccess ? 1 : 0;
    }
}
