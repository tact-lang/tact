struct InnerStruct {
    a: Int;
    b: Bool;
    c: String?;
}

contract TestStorage {
    data: InnerStruct; 

    init() {
        self.data = InnerStruct{
            a: 5,
            b: true,
            c: "hello",
        };
    }
}