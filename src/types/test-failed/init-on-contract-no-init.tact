primitive Int;

contract Contract(
    foo: Int as int16,
) {
    init(bar: Int) {
        self.bar = bar;
    }
}