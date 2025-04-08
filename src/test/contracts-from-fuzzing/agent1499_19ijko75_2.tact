struct Coord {
    x: Int = 1;
    y: Int = 2;
}

contract NestedStructField {
    point: Coord = Coord{x:1,y:2};
}
