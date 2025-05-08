struct DeepNest {
    s1: Inner1;
}
struct Inner1 {
    s2: Inner2;
}
struct Inner2 {
    s3: Inner3;
}
struct Inner3 {
    s4: Inner4;
}
struct Inner4 {
    leaf: Int;
}

contract Test32 {
    val: DeepNest;

    init() {
        self.val = DeepNest{ s1: Inner1{ s2: Inner2{ s3: Inner3{ s4: Inner4{ leaf:123 }}}}};
    }
}