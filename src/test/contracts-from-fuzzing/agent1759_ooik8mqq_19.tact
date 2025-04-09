struct Thing {
    a: Int;
    b: Bool;
    c: String;
}

contract InitDefaults {
    t: Thing = Thing{ a:3, b:true, c:"hi" };
}
