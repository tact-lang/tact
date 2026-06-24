struct SimpleStruct {
    a: Int;
    b: Bool;
}

struct Wrapper1 {
    s: SimpleStruct;
}

struct Wrapper2 {
    s: Wrapper1;
}

struct Wrapper3 {
    s: Wrapper2;
}

contract DeepWrapper {
    val: Wrapper3;
    init() {
        self.val = Wrapper3{ s: Wrapper2{ s: Wrapper1{ s: SimpleStruct{a:12, b:true} } } };
    }
}