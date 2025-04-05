contract TestOptionalAssertion {
    fun showcase() {
         let opt: Int? = 42;
         dump(opt!!); // expected: 42
    }
}
