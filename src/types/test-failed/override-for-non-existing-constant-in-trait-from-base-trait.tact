primitive Int;

trait BaseTrait {
    const FOO: Int = 10;
}

trait Test {
    override const BAR: Int = 10;
}
