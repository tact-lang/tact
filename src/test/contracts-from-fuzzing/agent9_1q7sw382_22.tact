contract GetterCallInternalFixed {
    v: Int = 5;

    receive() {}

    fun addOne(x: Int): Int {
        return x + 1;
    }

    get fun getComputed(): Int {
        return self.addOne(self.v);
    }
}
