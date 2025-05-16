struct MyStruct { val: Int }

contract TestContract {
    s: MyStruct?;

    init() {
        self.s = null;
    }
}