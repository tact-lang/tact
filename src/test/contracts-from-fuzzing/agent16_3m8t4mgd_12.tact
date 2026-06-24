struct MyStruct { value: Int; }

contract TestFieldAccess() {
    fun test() {
        // Testing struct instantiation and field access
        let a: MyStruct = MyStruct { value: 42 };
        dump(a.value); // expected output: 42
    }
    receive() {
        self.test();
    }
}
