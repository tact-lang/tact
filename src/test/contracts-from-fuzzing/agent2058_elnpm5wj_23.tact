// deeply nested optionals, allowed for struct fields
struct A { foo: Int }
struct B { a: A? }
struct C { b: B? }

contract Test {
    val: C;
    
    init() {
        self.val = C{ b: null };
    }
}