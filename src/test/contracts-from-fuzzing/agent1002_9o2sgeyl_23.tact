struct DataOne {
    a: Int;
    b: Bool;
}

struct DataTwo {
    c: Int;
    d: Bool;
}

contract MultipleStructs {
    one: DataOne;
    two: DataTwo;

    init() {
        self.one = DataOne{ a:10, b:false };
        self.two = DataTwo{ c:20, d:true };
    }
}