// Two unrelated structs as persistent fields, one nested
struct Inner {
    flag: Bool;
    message: String;
}

struct Outer {
    inner: Inner;
    count: Int;
}

contract MultiStruct {
    s1: Inner;
    s2: Outer;

    init() {
        self.s1 = Inner{ flag:true, message:"hi" };
        self.s2 = Outer{ inner: self.s1, count: 42 };
    }
}