contract ModifyTest {
    val: Int;

    init() {
        self.val = 0;
    }

    // getter function, attempting to modify state variable
    get fun modify(): Int {
         self.val = 123;
         return self.val;
    }
}
