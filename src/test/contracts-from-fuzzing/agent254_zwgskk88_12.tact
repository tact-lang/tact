struct Z { z: Int; }
struct Y { y: Int?; nested: Z?; }
struct X { x: Int; nested: Y?; }

contract TestDeep {
    optX: X?;        // top-level optional
    normX: X = X{ x:1, nested:null }; // direct, with nested optional null
    receive() {}
}