struct SubStruct {
    x: Int;
    y: String?;
}

contract TestContract {
    data: SubStruct;

    init() {
        self.data = SubStruct{
            x: 42,
            y: null,
        };
    }

    receive(){}
}