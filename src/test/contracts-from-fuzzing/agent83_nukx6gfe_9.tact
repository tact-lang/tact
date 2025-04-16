struct Inner {
    i: Int;
    flag: Bool;
}

struct Outer {
    inner: Inner?;
    note: String;
}

contract TestComplex {
    data: Outer = Outer{ inner: null, note: "default" };

    receive() {}

    get fun getComplex(): Outer {
         return self.data;
    }
}
