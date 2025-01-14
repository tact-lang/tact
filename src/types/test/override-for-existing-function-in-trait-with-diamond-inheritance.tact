trait BaseTrait {}

trait T {
    fun bar() {}
}

trait T2 with T {
    fun baz() {}
}

trait T3 with T {
    fun ban() {}
}

trait Test with T2, T3 {
    override fun bar() {}
}
