struct SubStruct {
    x: Int;
    y: Int?;
    z: Bool;
    w: String?;
}

contract TestContract {
    myData: SubStruct?;

    init() {
        self.myData = SubStruct{
            x: 42,
            y: null,
            z: true,
            w: "hello"
        };
    }
}
