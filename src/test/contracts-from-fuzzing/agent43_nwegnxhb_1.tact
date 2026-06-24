struct NestedOptional {
    inner: Int?;
}

contract TestContract {
    nested: NestedOptional?;
    
    receive() {
        // just reference to force compilation
        let _ = self.nested;
    }
}