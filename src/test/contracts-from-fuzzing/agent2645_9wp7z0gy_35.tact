trait Base {
    virtual const FOO: Int = 1;
}

contract Child with Base {
    override const FOO: Int = 42;
}
