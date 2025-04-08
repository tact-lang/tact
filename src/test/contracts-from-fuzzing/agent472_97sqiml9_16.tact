struct A {
    f1: Int?;
    f2: Bool?;
}

contract OptFieldStruct {
    a_field: A?;
    init() {
        self.a_field = null;
    }
}