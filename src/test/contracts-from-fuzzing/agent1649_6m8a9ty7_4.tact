struct MyStruct {
    a: Int;
    b: Bool;
    s: String;
    c: Cell;
}

contract TestContract {
    data: MyStruct;

    init() {
        self.data = MyStruct{
            a: 1,
            b: true,
            s: "abc",
            c: emptyCell(),
        };
    }
}