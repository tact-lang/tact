struct SimpleStruct { count: Int; message: String; flag: Bool; }

contract VarietyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: SimpleStruct;
    i: Int?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "test";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.g = myAddress();
        self.h = SimpleStruct{ count: 5, message: "hi", flag: false };
        self.i = null;
    }
}