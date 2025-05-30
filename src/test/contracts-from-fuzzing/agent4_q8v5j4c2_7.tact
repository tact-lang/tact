trait T1 {
    abstract const X: Int;
}

trait T2 {
    abstract const X: Int;
}

contract Test() with T1, T2 {
    override const X: Int = 42;

    get fun result(): Int {
        return self.X;
    }
}

// Expected behavior: Deploying Test contract and calling getter 'result' should yield 42.