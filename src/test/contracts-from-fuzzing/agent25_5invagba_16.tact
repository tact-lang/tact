struct S {
    a: Int;
}

extends fun inc(self: S): S {
    return S { a: self.a + 1 };
}

extends fun dbl(self: S): S {
    return S { a: self.a * 2 };
}

contract TestChainedExtensions {
    receive() {
         let s: S = S { a: 10 }.inc().dbl();
         dump(s.a); // expected output: 22
    }
}
