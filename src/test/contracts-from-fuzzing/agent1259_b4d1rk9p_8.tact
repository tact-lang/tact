struct OptDeepNest1 { a: Int?; }
struct OptDeepNest2 { b: OptDeepNest1?; }
struct OptDeepNest3 { c: OptDeepNest2?; }

contract TestContract {
    val: OptDeepNest3;
    
    init() {
        self.val = OptDeepNest3{ c: OptDeepNest2{ b: OptDeepNest1{ a: null } } };
    }
}