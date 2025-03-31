/// Snippet 6: Self-referential initOf

contract SelfRef {
    init() {
        // Self-reference using initOf on the same contract
        let pkg = initOf SelfRef();
        let addr = contractAddress(pkg);
    }
}
