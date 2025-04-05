struct BigStruct {
    Field1: Int;
    Field2: Int;
    Field3: Int;
    Field4: Int;
    Field5: Int;
    Field6: Int;
    Field7: Int;
    Field8: Int;
    Field9: Int;
    Field10: Int;
}

contract TestFlat {
    receive() {
        let a: BigStruct = BigStruct { Field1: 1, Field2: 2, Field3: 3, Field4: 4, Field5: 5, Field6: 6, Field7: 7, Field8: 8, Field9: 9, Field10: 10 };
        dump(a.Field5);
    }
}
