struct DefaultStruct {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
}

contract DefaultsTest {
    f: DefaultStruct = DefaultStruct{};
    receive() {
        let _ = self.f.b;
    }
}