struct Inner { z: Int; }
struct Middle { y: Inner?; }

contract DeepNestTest {
    value: Middle;

    init() {
        self.value = Middle{ y: null };
    }

    receive() {
        let tmp = self.value;
    }
}