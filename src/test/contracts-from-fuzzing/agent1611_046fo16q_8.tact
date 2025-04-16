struct Inner1 {
    val1: Int?;
}
struct Inner2 {
    val2: Inner1?;
}
struct Inner3 {
    val3: Inner2?;
}
contract OptNest {
    data: Inner3;
    init() {
        self.data = Inner3{ val3: null };
    }
}
