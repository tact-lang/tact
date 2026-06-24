struct Inner1 {
    v1: Int;
}
struct Inner2 {
    v2: Inner1;
}
struct Inner3 {
    v3: Inner2;
}
contract DeepInner {
    deep: Inner3;
    init() {
        self.deep = Inner3{
            v3: Inner2{
                v2: Inner1{
                    v1: 123
                }
            }
        };
    }
}