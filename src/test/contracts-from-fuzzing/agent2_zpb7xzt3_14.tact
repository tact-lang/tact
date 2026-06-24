struct MyData {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
}

contract TestContract {
    data: MyData;
    init() {
        self.data = MyData{
            a: 42,
            c: myAddress(),
            f: emptyCell().asSlice()
        };
    }
}