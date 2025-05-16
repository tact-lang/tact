struct S {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

struct Wrapper {
    val: S?;
}

contract OptNestedStruct {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            val: null
        };
    }
}