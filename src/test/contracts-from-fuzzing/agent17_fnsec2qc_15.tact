contract TestCP(foo: Int, bar: Int) {
    get fun getSum(): Int {
        return self.foo + self.bar;
    }

    get fun getFoo(): Int {
        return self.foo;
    }

    get fun getBar(): Int {
        return self.bar;
    }
}
