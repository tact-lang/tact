struct StructWithString {
    s: String;
}

contract TestStructString {
    receive() {
        // Instantiate a struct using the proper instantiation syntax with braces
        let myStr: String = "Struct test";
        let obj: StructWithString = StructWithString{ s: myStr };
        dump(obj.s);
    }
}
