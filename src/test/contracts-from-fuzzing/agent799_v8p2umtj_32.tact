struct A { foo: Int }
struct B { bar: A }
struct C { baz: B }

contract OptionalNestedChain {
    chain: C? = null;
    
    init() {
        self.chain = C{
            baz: B{
                bar: A{foo:42} 
            }
        };
    }
}