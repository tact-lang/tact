const MAGIC: Int = 5 * 3 + 1;

contract CompileTimeDefault {
    foo: Int = 40 + 2;
    bar: Int = pow(2, 6) + crc32("abc");
    baz: Int = MAGIC * 2;

    init() {
        self.foo = 100;
        self.bar = 200;
        self.baz = 300;
    }
}