trait T1 {
    virtual const VAL: Int = 10;
}

trait T2 {
    virtual const VAL: Int = 20;
}

contract MergeTest() with T1, T2 {
    // Must override VAL explicitly to resolve conflict
    override const VAL: Int = 30;

    get fun test(): Int {
        return self.VAL;
    }
}
