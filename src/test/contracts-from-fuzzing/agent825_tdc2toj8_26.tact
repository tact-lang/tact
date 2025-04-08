struct CrossStruct {
    b:Int;
    a:Int;
}

contract CrossStructTest {
    s: CrossStruct;

    init() {
        self.s = CrossStruct{
            a: 10,
            b: 20,
        };
    }
}