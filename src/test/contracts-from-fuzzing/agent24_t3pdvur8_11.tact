struct MyStruct {
    a: String;
}

contract Test {
    s: MyStruct = MyStruct { a: "Struct string literal" };

    receive() {
         dump(self.s.a);
    }
}
