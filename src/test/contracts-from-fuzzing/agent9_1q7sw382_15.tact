struct MyStruct {
    a: Int;
    b: Int;
}

contract GetterWithStructParameter {
    receive() {}
    
    get fun process(ms: MyStruct): Int {
        return ms.a + ms.b;
    }
}
