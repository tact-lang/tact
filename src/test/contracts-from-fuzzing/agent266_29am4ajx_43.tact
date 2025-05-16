struct NoDefaults {
    x: Int;
    y: Bool;
}

contract StructDefaultField {
    data: NoDefaults = NoDefaults{ x:0, y:false };
}