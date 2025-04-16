struct Point {
    x: Int;
    y: Int;
}

struct Rectangle {
    tl: Point;
    br: Point;
}

struct ComplexData {
    name: String;
    active: Bool;
    rect: Rectangle;
    label: String?;
    note: String?;
}

contract Geometry {
    prop: ComplexData;

    init() {
        self.prop = ComplexData{
            name:"rect",
            active:true,
            rect: Rectangle{ tl: Point{x:0,y:0}, br: Point{x:1,y:1} },
            label:null,
            note:null
        };
    }
}