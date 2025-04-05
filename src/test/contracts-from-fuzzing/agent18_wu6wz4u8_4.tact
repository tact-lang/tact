struct S {
    a: Int;
}

contract Test {
    receive() {
         // Testing trailing comma in struct instantiation
         let s = S{ a: 42, };
    }
}