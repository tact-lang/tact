struct Cont {
 a: Int;
 b: Bool;
 c: String;
}

contract InitTest {
 x: Cont;
 init() {
    self.x = Cont { a:5, b:true, c:"hi" };
 }
}