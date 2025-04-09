primitive Int;

trait BaseTrait {
    virtual const BAR: Int = 100;
}

trait Test with BaseTrait {
    override const BAR: Int = 100;
}
