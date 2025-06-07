struct OptDeep1 { val: Int?; }
struct OptDeep2 { val: OptDeep1?; }
struct OptDeep3 { val: OptDeep2?; }

contract OptDeepTest {
    data: OptDeep3;

    init() {
        self.data = OptDeep3 {
            val: OptDeep2 {
                val: OptDeep1 { val: null }
            }
        };
    }
}