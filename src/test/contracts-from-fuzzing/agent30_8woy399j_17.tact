struct Deep {
    a: String = "abc";
    b: Int;
    c: Int?;
}
contract ComplexDefault {
    data: Deep? = null;
    receive() { let _ = self.data; }
}