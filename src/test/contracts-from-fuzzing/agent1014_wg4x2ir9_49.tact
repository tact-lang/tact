struct Inner { 
    a: Int?; 
}
struct Outer {
    x: Int; 
    y: Inner?;
}

contract MixedOptionals {
    f: Outer = Outer{ x: 7, y: null };
}
