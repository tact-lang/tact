struct ConstInner { a: Int }

contract ConstTest {
    const val: Int = 123;
    data: ConstInner;

    init() {
        self.data = ConstInner{ a: self.val };
    }
}