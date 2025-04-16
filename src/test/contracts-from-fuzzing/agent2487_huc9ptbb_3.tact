struct BigStruct {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool?;
    f5: String;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            f1: 1, f2: 2, f3: true, f4: null, 
            f5: "five", f6: null, f7: 7, f8: false, 
            f9: "nine", f10: 10
        };
    }
}