// deep chain with multiple optionals 
struct O1 { val: Int?; }
struct O2 { o1: O1?; }
struct O3 { o2: O2?; }
struct O4 { o3: O3?; }
contract ChainOptionals {
    val: O4?;

    init() {
        self.val = null;
    }
}