contract TestOptionalUnwrap {
    opt: Int? = 50;

    receive() {
         let x: Int = self.opt!!;
         dump(x); // Expected to dump 50
    }
}
