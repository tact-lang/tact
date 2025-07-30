struct Nested {
    x: Int;
}

struct Outer {
    inner: Nested?;
}

contract Test {
    receive() {}
    
    // Getter returning a nested optional struct
    get fun getOuter(): Outer {
         return Outer{ inner: Nested{ x: 123 } };
    }
}
