struct OptStruct {
    val: Int = 5;
}

contract OptStructField {
    myStruct: OptStruct?;

    init() {
        self.myStruct = null;
    }

    receive() {}
}