struct A {
    x: Int;
    y: Bool;
}

struct B {
    f: A;
    g: Int?;
}

contract DeepField {
    storage: B;

    init() {
        self.storage = B{
            f: A{x:42,y:true},
            g: null
        };
    }
}