struct Nested { value: Int = 42; }

contract TestContract {
    nestedField: Nested?;

    receive() {
        if (self.nestedField != null) {
            dump(self.nestedField!!.value);
        }
    }
}