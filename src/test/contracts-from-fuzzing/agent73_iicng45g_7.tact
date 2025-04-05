struct S { x: Int }

contract Playground {
    receive("plays") {
        // Field access expression: access field 'x' from struct S
        let s = S { x: 10 };
        dump(s.x);
    }
}
