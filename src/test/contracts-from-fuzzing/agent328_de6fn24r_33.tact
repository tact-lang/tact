struct Lo1 { x: Int? = null }
struct Lo2 { y: Lo1? = null }
struct Lo3 { z: Lo2? = null }

contract Test {
    deepOpt: Lo3;
    init() {
        self.deepOpt = Lo3{};
    }
}