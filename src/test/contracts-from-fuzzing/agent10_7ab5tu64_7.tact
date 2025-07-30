trait T1 {
    virtual const X: Int = 5;
}

trait T2 {
    virtual const X: Int = 7;
}

contract CorrectMulti() with T1, T2 {
    // Provide the necessary override to resolve conflict
    override const X: Int = 100;

    get fun test(): Int {
        return self.X;
    }
}
