struct InnerData { x: Int; y: Bool; }

contract FieldArrange {
    a: Bool;
    b: Int;
    c: InnerData;
    d: String;
    e: Cell;

    init() {
        self.a = false;
        self.b = 123;
        self.c = InnerData{x:4,y:true};
        self.d = "arranged";
        self.e = emptyCell();
    }
}