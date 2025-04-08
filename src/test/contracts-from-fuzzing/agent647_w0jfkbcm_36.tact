// contract with many optionals and nested optionals fields
struct Inner {
    a: Int?;
    b: Bool?;
}

struct Outer {
    f1: Inner?;
    f2: Inner?;
    f3: Bool?;
    f4: Int?;
}

contract TestContract {
    myData: Outer?;

    init() {
        self.myData = null;
    }
}