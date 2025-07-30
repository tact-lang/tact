struct IntBoolString {
    a: Int;
    b: Bool;
    c: String;
}

contract ManyCopies {
    c1: IntBoolString = IntBoolString{a:1,b:true,c:"a"};
    c2: IntBoolString = IntBoolString{a:2,b:false,c:"b"};
    c3: IntBoolString = IntBoolString{a:3,b:true,c:"c"};
    c4: IntBoolString = IntBoolString{a:4,b:false,c:"d"};
    c5: IntBoolString = IntBoolString{a:5,b:true,c:"e"};

    init() {}
}