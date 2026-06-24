struct OptStruct {
    a: Int;
    b: Int?;
}

contract TestOptionalFixed {
    receive() {
        let obj: OptStruct = OptStruct { a: 42, b: null };
        return;
    }
}
