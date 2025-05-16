struct MyStruct {
    counter: Int;
}

contract Test {
    receive() {
        let s = MyStruct{counter: 5};
        s.counter = 10;
    }
}