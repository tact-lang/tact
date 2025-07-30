struct N { x: Int }
struct M { y: Int }

contract TestContract {
    n: N?;
    m: M?;

    init() {
        self.n = N{x:1};
        self.m = M{y:2};
    }
}