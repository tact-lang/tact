struct NestedOptional {
    a: Int;
    opt: Int?;
}

contract TestNestedOptional {
    receive() {
         let ns: NestedOptional = NestedOptional{ a: 50, opt: 100 };
         dump(ns.opt);
    }
}
