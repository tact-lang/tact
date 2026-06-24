struct MyStruct {
    x: Int;
    flag: Bool?;
    name: String;
}

contract TestContract {
    data: MyStruct;

    init() {
        self.data = MyStruct{
            x: 1,
            flag: null,
            name: "abc",
        };
    }
}