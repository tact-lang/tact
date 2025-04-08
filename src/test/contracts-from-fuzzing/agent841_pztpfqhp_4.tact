struct A {
    x: Int?;
    y: Bool?;
}

struct B {
    a: A;
    s: String?;
}

contract NestedNullable {
    val: B;
    init() {
        self.val = B{
            a: A{x:null,y:null},
            s: null
        };
    }
}
