contract MainContract {
    get fun testAugmentedAssignOperators(intVal: Int, intVal2: Int, boolVal: Bool, boolVal2: Bool): Int {
        let a = intVal;

        a += intVal2;
        a -= intVal2;

        let b = boolVal;

        b &&= boolVal2;
        b ||= boolVal2;

        return a + (b ? 10 : 20);
    }
}
