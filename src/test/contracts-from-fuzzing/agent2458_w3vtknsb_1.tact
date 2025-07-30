struct BasicStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    data: BasicStruct;

    init() {
        self.data = BasicStruct{
            a: 1,
            b: true,
            c: "hello"
        };
    }
}