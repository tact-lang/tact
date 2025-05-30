struct NestedOptionalWrapped { inner: Int?; }

contract TestContract {
    nestedOpt: NestedOptionalWrapped?;
    
    init() {
        self.nestedOpt = null;
    }
}