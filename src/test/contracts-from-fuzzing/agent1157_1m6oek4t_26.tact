struct OptionalNest { q: Int; }

contract ParamOptStructTest(
    data: OptionalNest?
) {
    receive() {
        let tmp = self.data;
    }
}