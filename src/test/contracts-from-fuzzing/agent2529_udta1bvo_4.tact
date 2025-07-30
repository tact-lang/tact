struct Inner {
    a: Int?;
    b: Bool?;
}

struct Outer {
    inner: Inner?;
    s: String?;
}

contract TestContract {
    myField: Outer = Outer{
        inner: Inner{
            a: 10,
            b: null,
        },
        s: null,
    };

    init() {
        self.myField = Outer{ inner: null, s: "hi" };
    }
}