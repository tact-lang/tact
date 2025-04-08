struct MyData {
    foo: Int;
}

contract TestContract {
    myOptStruct: MyData?;

    init() {
        // no init, testing implicit null
    }
}