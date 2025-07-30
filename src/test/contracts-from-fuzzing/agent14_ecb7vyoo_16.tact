contract TestNonNullAssertion {
    receive() {
         let opt: Int? = null;
         dump(opt!!);
         dump(42);
    }
}
