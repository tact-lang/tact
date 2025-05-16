struct Sub {
    s: String;
    f: Bool;
}

contract WithDefaults {
    a: Int = 5;
    b: String = "ok";
    c: Bool = false;
    d: Sub = Sub{ s: "x", f: true };
}