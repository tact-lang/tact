struct MultiType {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
}

contract TestContract {
    counter: Int;
    flag: Bool;
    message: String;
    data: MultiType;

    init() {
        self.counter = 0;
        self.flag = false;
        self.message = "hi";
        self.data = MultiType{
            intVal: 1,
            boolVal: true,
            stringVal: "abc"
        };
    }
}