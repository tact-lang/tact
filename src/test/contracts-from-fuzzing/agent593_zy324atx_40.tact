// Optional Int initialized to null but assigned large negative value
contract NegOptInt {
    v: Int? = null;
    init() {
        self.v = -123456789;
    }
}