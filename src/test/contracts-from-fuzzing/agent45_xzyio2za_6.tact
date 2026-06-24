struct MyStruct { s: String; }

contract TestStructString {
    receive() {
        let obj: MyStruct = MyStruct { s: "This is a string inside a struct." };
        dump(obj.s);
    }
}
