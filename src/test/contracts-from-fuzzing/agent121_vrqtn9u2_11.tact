contract TestReturnNestedInGetterFixed {
    v: Int = 0;

    get fun test(): Int {
        {
            if (self.v > 0) {
                return self.v;
            }
        }
        return 0;
    }
}
