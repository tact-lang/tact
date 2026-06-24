struct Mixed {
    a: Int = 3;
    b: Bool;
    c: String?;
    d: Int?;
    e: String;
}

contract Mix {
    m: Mixed = Mixed{ b:true, c:"a", d:null, e:"x" };
}
