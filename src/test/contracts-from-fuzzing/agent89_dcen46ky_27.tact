struct Composite {
    x: Int;
    y: Int?;
    s: String?;
    b: Bool;
}

contract Fuzz27 {
    arr: Composite;

    init() {
        self.arr = Composite{ x:0, y:null, s:null, b:true };
    }
}