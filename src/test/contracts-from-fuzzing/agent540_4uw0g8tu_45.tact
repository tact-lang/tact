struct O4 { val: Int? = null; }
struct O3 { o4: O4? = null; }
struct O2 { o3: O3? = null; }
struct O1 { o2: O2? = null; }

contract DeepOptNull {
    s: O1? = null;
    init() {
        self.s = null;
    }
}