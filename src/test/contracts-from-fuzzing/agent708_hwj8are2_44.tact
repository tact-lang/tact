struct T {
    x: Int?;
}

contract OptDefaultNull {
    val: T = T{ x: null };

    init() {}
}