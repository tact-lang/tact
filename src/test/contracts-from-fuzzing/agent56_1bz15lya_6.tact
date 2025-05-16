trait TA {
    virtual const v: Int = 5;
}

trait TB {
    virtual const v: Int = 10;
}

contract Diamond() with TA, TB {
    // Override the ambiguous virtual constant
    override const v: Int = 15;

    // Getter to return the value of v
    get fun val(): Int {
        return self.v;
    }
}
