struct AllowsTrailingComma {
    x: Int;
    y: String;
    z: Bool;
}

contract TrailingCommaUse {
    s: AllowsTrailingComma = AllowsTrailingComma{
        x:1,
        y:"hi",
        z:true,
    };
}