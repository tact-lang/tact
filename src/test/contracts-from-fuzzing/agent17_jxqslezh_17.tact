extends fun safeInc(self: Int?): Int {
    if (self != null) {
       return (self!!) + 1;
    } else {
       return 0;
    }
}

contract OptionalTest(x: Int?) {
    get fun test(): Int {
        return self.x.safeInc();
    }
}
