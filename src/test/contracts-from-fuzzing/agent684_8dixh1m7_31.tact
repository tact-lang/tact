struct SelfReferenceTest {
    val: Int;
}

contract ReferenceSelfStruct {
    s: SelfReferenceTest;
    init() {
        self.s = SelfReferenceTest { val: 99 };
    }
}