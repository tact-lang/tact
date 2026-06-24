trait VirtualOverride {
    virtual const SOME_CONST: Int = 1;
}

contract VirtualConstOverride with VirtualOverride {
    override const SOME_CONST: Int = 42;

    init() {}
}