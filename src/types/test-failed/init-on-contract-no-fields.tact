primitive Int;

contract Contract(
    foo: Int as int16,
) {
    foo: Int as int16 = 0;
    get fun getFoo(): Int {
        return self.foo;
    }
}