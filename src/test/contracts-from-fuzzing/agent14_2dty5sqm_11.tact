struct EqualityResult {
    shallow: Bool;
    deep: Bool;
}

contract TestMapEquality {
    m1: map<Int, Bool> = emptyMap();
    m2: map<Int, Bool> = emptyMap();

    init() {
         self.m1.set(1, true);
         self.m2.set(1, true);
    }

    // Returns a struct containing shallow equality using '==' and deep equality using .deepEquals()
    get fun testEquality(): EqualityResult {
         return EqualityResult{
             shallow: self.m1 == self.m2,
             deep: self.m1.deepEquals(self.m2)
         };
    }
}
