// contract parameter with nested optional struct
struct Child {
    foo: Int?;
}

contract TestContract(
    val: Child?,
) {
    receive() {
        if (self.val != null) {
            let _ = self.val!!.foo;
        }
    }
}