struct Big {
    a: Int = 1;
    b: Int = 2;
    c: Bool = false;
    d: Bool = true;
    e: String = "e";
    f: String = "f";
    g: Address?;
    h: Cell?;
    i: Slice?;
    j: Bool?;   
    k: Int?;    
    l: String?; 
    m: Int = -1;
    n: Bool = true;
    o: Int = 123;
    p: String = "p";
    q: Int = 456;
    r: Bool = false;
    s: String = "s";
    t: Int?;
}

contract TestContract {
    state: Big = Big{};

    init() {}
}