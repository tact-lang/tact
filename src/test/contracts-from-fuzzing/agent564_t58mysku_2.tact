struct NestedStruct {
    a: Int;
    b: Int?;
    c: Bool;
}

contract TestContract {
    ns: NestedStruct;

    init() {
        self.ns = NestedStruct{
            a: 1,
            b: null,
            c: true
        };
    }

    receive() {
        // access nested persistent struct
        if (self.ns.b != null) {
            self.ns.a = self.ns.a + 1;
        }
    }
}