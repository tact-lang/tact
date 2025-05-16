contract TestBoolAugAssAnd {
    flag: Bool;

    init() {
         self.flag = true;
    }

    receive() {
         self.flag &&= false; // should perform logical AND and assign the result
         dump(self.flag); // expected output: false
    }
}
