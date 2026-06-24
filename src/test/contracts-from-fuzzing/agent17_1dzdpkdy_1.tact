struct A { value: Int; }

contract TestContract {
    val: A;

    init() {
        self.val = A{ value: 42 };
    }
}