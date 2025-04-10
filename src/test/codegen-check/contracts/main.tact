contract MainContract {
    get fun testAugmentedAssignOperators(intVal: Int, boolVal: Bool): Int {
        let a = 100;

        a += intVal;
        a -= intVal;

        let b = true;

        b &&= boolVal;
        b ||= boolVal;

        return a + (b ? 10 : 20);
    }
}
