// long list persistent state, mix of primitives and structs
struct Point { x: Int; y: Int; }

contract TestContract {
    int1: Int;
    int2: Int;
    bool1: Bool;
    bool2: Bool;
    str1: String;
    str2: String;
    addr1: Address;
    addr2: Address;
    cell1: Cell;
    cell2: Cell;
    slice1: Slice;
    slice2: Slice;
    s1: Point;
    s2: Point;
    s3: Point;
    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.bool1 = true;
        self.bool2 = false;
        self.str1 = "one";
        self.str2 = "two";
        self.addr1 = myAddress();
        self.addr2 = myAddress();
        self.cell1 = emptyCell();
        self.cell2 = emptyCell();
        self.slice1 = emptyCell().asSlice();
        self.slice2 = emptyCell().asSlice();
        self.s1 = Point { x:1, y:2 };
        self.s2 = Point { x:3, y:4 };
        self.s3 = Point { x:5, y:6 };
    }
}