struct MyStruct {
    field: String;
}

fun createStruct(): MyStruct {
    return MyStruct { field: "test struct string" };
}

contract TestContract {
    receive() {
        let s: MyStruct = createStruct();
    }
}
