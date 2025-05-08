struct S { value: Int }

contract TestFieldAccess {
    receive() {
        // Instantiate a struct and access its field
        let s: S = S { value: 100 };
        dump(s.value);
    }
}
