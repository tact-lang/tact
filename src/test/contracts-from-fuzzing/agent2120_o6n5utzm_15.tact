struct Point { x: Int; y: Int; label: String; }

contract InitWithStruct {
    pt: Point;
    init() {
        self.pt = Point{ x:10, y:20, label:"center" };
    }
}