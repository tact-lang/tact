contract TestGetterReturn {
    v: Int = 10;

    get fun test(): Int {
        return self.v;
    }
}
