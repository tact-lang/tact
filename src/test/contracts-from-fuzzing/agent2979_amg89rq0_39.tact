struct Inner { a:Int; b:Bool }

contract NestedAssignment2 {
    foo: Inner;

    init() {
        self.foo = Inner{ a:42, b:true };
    }
}