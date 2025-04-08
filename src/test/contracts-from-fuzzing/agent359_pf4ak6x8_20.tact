struct S1 { a: Int }

contract TestManyInits {
    val: S1;
    val2: S1;
    init() {
        self.val = S1{a:1};
        self.val2 = S1{a:2};
    }
}