struct SSS { s: String; s2: String; }

contract FieldOrderTest {
    a: Int = 1;
    s: SSS = SSS{s:"hi", s2:"there"};
    b: Int = 2;
    receive() {}
}