struct CoordOpt {
    x: Int?;
    y: Int?;
}

contract NestedOptionalStructField {
    point: CoordOpt = CoordOpt{x: null, y: null};
}
