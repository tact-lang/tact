struct SDefault {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
}

contract DefaultStruct {
    s: SDefault = SDefault{};
    receive() {
        let _ = self.s.a;
    }
}