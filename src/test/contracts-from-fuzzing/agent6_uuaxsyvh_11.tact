fun optionalOrNull(x: Int): Int? {
    return x > 0 ? x : null;
}

contract TestUnify2 {
    receive() {
        let a = optionalOrNull(5);
        let b = optionalOrNull(-1);
    }
}