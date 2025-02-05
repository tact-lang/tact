primitive Int;

trait BaseTrait {
    const FOO: Int = 100;
}
trait T with BaseTrait {
    const BAR: Int = 100;
}

trait T2 {
    const BAZ: Int = 100;
}

trait Test with T, T2 {
    override const FOO: Int = 100;
}
