contract OptionalTest {
    fun getMaybe(): Int? {
        return 42;
    }

    receive() {
        let val: Int = self.getMaybe()!!;
        dump(val);
    }
}
