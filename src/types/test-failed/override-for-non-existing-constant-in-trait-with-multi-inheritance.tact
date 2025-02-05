primitive Int;

trait BaseTrait {}
trait T {
    const BAR: Int = 10;
}

trait T2 {
    const BAZ: Int = 10;
}

trait Test with T, T2 {
    override const FOO: Int = 10;
}
