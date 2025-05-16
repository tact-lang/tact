contract TestMapOps2 {
    get fun run() : Int {
        let m: map<Int, Int> = emptyMap();
        // Set a value
        m.set(100, 200);
        let v: Int = m.get(100)!!; // 200

        // exists tests using ternary operator 
        let exists100: Int = m.exists(100) ? 1 : 0;
        let exists101: Int = m.exists(101) ? 1 : 0;

        // isEmpty test (should be false, so 0)
        let emptyFlag: Int = m.isEmpty() ? 1 : 0;

        // replace test: replace key 100 with new value 250
        let rep: Bool = m.replace(100, 250);
        let repFlag: Int = rep ? 1 : 0;
        let newVal: Int = m.get(100)!!; // should be 250

        // replace with null deletion: key 100 should be deleted
        let repDel: Bool = m.replace(100, null);
        let repDelFlag: Int = repDel ? 10 : 0;

        // Test replaceGet
        m.set(200, 300);
        let oldVal: Int = m.replaceGet(200, 350)!!; // returns old value 300
        let noneVal = m.replaceGet(300, 400); // returns null, key 300 doesn't exist

        // Test deletion using .del()
        m.set(400, 500);
        let delOk: Bool = m.del(400);
        let delOkVal: Int = delOk ? 1000 : 0;
        let delAgain: Bool = m.del(400);
        let delAgainVal: Int = delAgain ? 100 : 0;

        // Sum up: newVal=250, exists100=1, exists101=0, repFlag=1, repDelFlag=10, oldVal=300, delOkVal=1000, delAgainVal=0
        // Total expected: 250 + 1000 + 0 + 1 + 10 + 300 + 1000 + 0 = 2561
        return newVal + exists100 * 1000 + exists101 * 100 + repFlag + repDelFlag + oldVal + delOkVal + delAgainVal;
    }
}
