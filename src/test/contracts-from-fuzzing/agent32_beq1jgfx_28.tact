message Point {
 x: Int;
 y: Int;
}

contract Test {
 receive() {
   let p = Point{ y: 5, x: 3 };
 }
}