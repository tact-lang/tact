struct HasVal {
    x: Int = 2;
}

contract TrailingCommaDefault {
    h: HasVal = HasVal{
        x: 5,
    };
}