struct BigStruct {
    i1: Int;
    i2: Int;
    i3: Int;
    flag1: Bool;
    flag2: Bool;
    opt1: Int?;
    opt2: Bool?;
    s: String;
}

contract TestContract {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            i1: 1,
            i2: 2,
            i3: 3,
            flag1: true,
            flag2: false,
            opt1: null,
            opt2: null,
            s: "test"
        };
    }
}