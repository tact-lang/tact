struct Inner { a: Int; }
struct Outer { inner: Inner; flag: Bool; }

contract TestNestedGetter {
    receive() {}
    
    // Getter returning a nested structure
    get fun getNested(): Outer {
         return Outer { inner: Inner { a: 1234 }, flag: true };
    }
}
