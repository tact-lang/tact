// nested Int? inside struct with default null
struct X {
    v: Int? = null;
}
contract NullStructDefault {
    x: X;
    init() {
        self.x = X{};
    }
}