struct Point { x: Int; y: Int }

contract InlineStructDefault {
    pos: Point = Point{ x: 0, y: 0 };

    init() {}
}