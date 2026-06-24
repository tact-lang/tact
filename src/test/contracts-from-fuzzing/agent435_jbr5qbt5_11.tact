// Contract with optional struct as field initialized with concrete value
struct MyStruct {
    val: Int;
    flag: Bool;
}

contract TestContract {
    maybeStruct: MyStruct? = null;

    init() {
        self.maybeStruct = MyStruct{
            val: 777,
            flag: true,
        };
    }
}
