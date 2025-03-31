struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test {
    receive() {
         let instance = MyStruct{ a: 7, b: false };
         dump(instance.toCell());
    }
}
