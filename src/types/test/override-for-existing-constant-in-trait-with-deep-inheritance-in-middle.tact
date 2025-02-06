primitive Int;

trait BaseTrait {}

trait T1 {}

trait T2 with T1 { const BAR: Int = 100; }

trait T3 with T2 {}

trait Test with T3 {
    override const BAR: Int = 100;
}
