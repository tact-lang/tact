struct NestedOptional2 {
    innerOpt: S1?;
}

struct S1 {
    a: Int;
    b: String;
}

contract NestedOptHolder {
    x: NestedOptional2;
    init() {
        self.x = NestedOptional2{
            innerOpt: null
        };
    }
}