contract TestOptionalValid {
    fun test() {
        // Valid optional usage: assign value to optional and then use non-null assertion
        let x: Int? = 10;
        let y = x!!;
        dump(y); // prints 10
    }
    
    receive() {}
}
