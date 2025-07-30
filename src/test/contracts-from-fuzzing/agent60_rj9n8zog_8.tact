contract Test {
    v: Int = 0;

    receive() {}

    get fun getV(): Int {
         self.v += 1;
         return self.v;
    }

    fun callGetter() {
        let x = self.getV();
        dump(x);
    }
}
