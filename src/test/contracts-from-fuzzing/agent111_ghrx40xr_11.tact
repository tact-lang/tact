// Struct with field default values inside persistent contract var
struct DefStruct {
    a: Int = 42;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultsTest {
    data: DefStruct;
    init() {
        self.data = DefStruct{}; // use defaults only
    }
}