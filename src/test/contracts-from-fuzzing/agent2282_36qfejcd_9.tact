struct Point { x: Int; y: Int; }

struct Rectangle { a: Point; b: Point; }

struct Scene { rect: Rectangle; label: String; isVisible: Bool; }

contract Test8 {
    data: Scene;

    init() {
        self.data = Scene{
            rect: Rectangle{
                a: Point{ x:0, y:0 },
                b: Point{ x:10, y:10 }
            },
            label: "foo",
            isVisible: true
        };
    }
}