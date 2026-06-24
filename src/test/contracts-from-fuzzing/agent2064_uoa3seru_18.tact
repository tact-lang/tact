struct NestOpt {
    x: Int;
    y: String?;
}

contract MixFlatNest {
    intFlat: Int = 5;
    strFlat: String = "z";
    nested: NestOpt = NestOpt{ x: 9, y: null };
    optInt: Int? = null;
}
