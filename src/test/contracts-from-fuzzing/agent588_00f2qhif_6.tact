// struct within struct with optionals in nested level
struct Nested {
    f1: Int?;
    f2: String?;
}

struct Container {
    inner: Nested;
    value: Bool;
}

contract TestContract {
    data: Container;
    init() {
        self.data = Container{
            inner: Nested{f1:null, f2:null},
            value: true
        };
    }
}