trait BaseTrait {
    virtual fun foo() {}
}

trait Test with BaseTrait {
    override fun foo() {}
}
