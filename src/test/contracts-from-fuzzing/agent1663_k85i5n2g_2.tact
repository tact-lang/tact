struct Nested {
    a: Int;
    b: Int?;
}

struct Outer {
    inner: Nested;
    flag: Bool;
}

contract DeepContract {
    payload: Outer;
    init() {
        self.payload = Outer{inner: Nested{a:1,b:null}, flag:true};
    }
}