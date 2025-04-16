struct X { foo: Int }
struct Y { x: X }

contract PartialInit {
    store: Y;
    
    init() {
        self.store = Y { x: X { foo: 123 } };
    }
    
    receive() {
        let _ = self.store.x.foo;
    }
}