struct SimpleStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract DefaultStructAssign {
    data: SimpleStruct;

    init() {
        self.data = SimpleStruct{
            a:1, b:true, c:"hi"
        };
    }

    receive() {
        let _ = self.data;
    }
}