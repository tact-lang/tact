primitive Int;

trait BaseTrait {}
trait T {
    virtual const BAR: Int = 10;
}

trait Test with T {
    override const BAR: Int = 100;
}
