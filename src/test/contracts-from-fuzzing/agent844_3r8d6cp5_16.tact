struct Ints {
    a: Int;
    b: Int;
    c: Int;
}

struct Bools {
    x: Bool;
    y: Bool;
}

contract Mix {
    ints: Ints = Ints{a:1,b:2,c:3};
    bools: Bools = Bools{x:true,y:false};
    s: String = "hi";
}