contract TestTernaryAssociativity {
    receive() {
        let a: Int = false ? 1 : (false ? 2 : 3); // expected: 3
        let b: Int = false ? 1 : false ? 2 : 3;     // expected: 3 (right-associative alternative cases)
        let c: Int = false ? 1 : true ? 2 : 3;      // expected: 2
        dump(a);
        dump(b);
        dump(c);
    }
}
