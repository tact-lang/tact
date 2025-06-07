struct A {
    v: Int
}

struct B {
    a: A?
}

struct C {
    b: B?
}

contract TestOptionalChain {
    receive() {
        // Construct the nested optional chain with non-null values
        let c = C { b: B { a: A { v: 42 } } };
        // Access the deeply nested field using the non-null assertion operator
        let value = c.b!!.a!!.v;
        // Optionally, you can dump the value to ensure it's accessible
        dump(value);
    }
}
