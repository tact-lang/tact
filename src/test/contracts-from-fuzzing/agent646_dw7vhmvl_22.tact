struct O1 { x: Int? }
struct O2 { y: O1 }
contract NestedOptionTest {
    state: O2;
    init() {
        self.state = O2{ y: O1{ x: null } };
    }
}