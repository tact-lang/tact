struct WrappedMap { val: map<Int, Int> }

contract OptionalWrappedMap {
    data: WrappedMap?;

    init() {
        self.data = null;
    }

    receive() {
        if (self.data != null) {
            let mapValue = self.data!!.val;
            mapValue.set(1, 2);
        }
    }
}