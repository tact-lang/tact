struct MyStrStruct {
    field: String;
}

contract TestStructString {
    receive() {
        let obj: MyStrStruct = MyStrStruct{ field: "Test Field with \n newline and \t tab" };
        if (obj.field == "Test Field with \n newline and \t tab") {
            // Branch taken when string equality works
        } else {
            // Should never be reached
        }
    }
}
